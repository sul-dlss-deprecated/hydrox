# frozen_string_literal: true

module Suri
  # Mix this module into generated work types in order to have IDs minted
  # as a druid.
  module Druid
    ## This overrides the default behavior, which is to ask Fedora for an id
    # @see ActiveFedora::Persistence.assign_id
    def assign_id
      service.mint
    end

    private

    def service
      @service ||= Suri::Minter.new
    end
  end
end
