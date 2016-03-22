module LabelsHelper
    def labels_to_buttons(labels)
        raw labels.map { |v| link_to v.name, label_path(id: v.id), class: 'btn-xs btn-primary'}.join(' ')
    end
end
