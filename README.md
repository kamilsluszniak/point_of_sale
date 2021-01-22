# README

To run the app:

- Spin-up the db: 'docker-compose up -d db'
- Load schema: 'rails db:schema:load'
- Create test database and load chema for it: 'RAILS_ENV=test rails db:create && rails db:schema:load'
- Run Rspec to confirm it works: 'rspec'
- Sed the database: 'rails db:seed'

Now you can go shopping in rails console:
- create Products::PointOfSale instance, e.g. 'pos = Products::PointOfSale.new'
- scan products barcodes with: 'pos.scan_barcode(product.code)'
- when done shopping, press exit to get the summary: 'pos.press_exit'