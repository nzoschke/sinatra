Sequel.migration do
  change do
    create_table(:queue) do
      primary_key :id
      String :text
      DateTime :created_at
    end
  end
end
