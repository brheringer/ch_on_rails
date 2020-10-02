class AccountsTotalizationReportController < ApplicationController
    def index
        # #no need to find_each and find_in_batches
        # #filters start, end
        if @params == nil || params.length == 0
            render 'index'
        else
            generate_report
        end
    end

    private
    def generate_report
        query = get_entries
        @totalization = totalize(query)
    end

    def get_entries
        query = Entry.where(data: @params[:start]..@param[:end]).where(universe_id: @params[:universe_id])
        
        if params[:account_id]
            query.where(account_id: params[:account_id])
        end
        
        if params[:cost_center_id]
            query.where(cost_center_id: params[:cost_center_id])
        end
        
        if params[:tag_id]
            #TODO
        end

        query.order(date: asc).joins(:account).joins(:cost_center).joins(:universe).left_outer_joins(:tags)

        byebug
        # #TODO order by account structure, filter by account/center/universe/tag
    end

    def totalize(entries)
        # #[{structure, description, total}]
        totalization = []
        entries.each do |e|
            sum_recursively(totalization, e.account.structure, e.account.name, e.value)
        end
        return totalization
    end

    def sum_recursively(totalization, structure, name, value)
        if !structure.empty?
            if totalization.key?(structure)
                totalization[structure][1] += value
            else
                if name == nil
                    name = Account.find_by(structure: structure).name
                end
                totalization[structure] = [name, value]
            end
            structure = get_parent_structure(structure) #TODO refactor
            sum_recursively(totalization, structure, nil, value)
        end
    end

    def get_parent_structure(structure) #TODO refactor
        i = structure.last_index_of('.') 
        return i >= 0 ? structure.substring(0, i) : ''
    end
end

#TODO n+1?
#Author.left_outer_joins(:posts)
#TODO refactor business to new class