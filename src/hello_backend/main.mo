import Debug "mo:base/Debug";
import Text "mo:base/Text";
import Bool "mo:base/Bool";
import Map "mo:base/HashMap";
import Error "mo:base/Error";
import List "mo:base/List";

actor Invoice {
  type Track = {
    subject : Text;
    status : Text;
    msg_id : Text;
    to : Text;
    api_key_id : Text;
    events : Text;
  };

  type Invoice = {
    invoice_type : Text;
    invoice_id : Text;
    vendor_id : Text;
    mongo_id : Text;
    creation_date : Text;
    vendor_email : Text;
    action : Text;
    ack : Bool;
    finance : Bool;
    financing_details : [Text];
    vendor_email_hash : Text;
    vendor_mobile_number_hash : Text;
    vendor_mobile_number : Text;
    client_first_name : Text;
    client_last_name : Text;
    vendor_name : Text;
    client_email : Text;
    client_mobile_number : Text;
    currency : Text;
    fund_reception : Text;
    lines : Text;
    net_amt : Text;
    paid : Bool;
    rejected : Bool;
    voided : Bool;
    draft : Bool;
    sent_invoice_deleted : Bool;
    received_invoice_deleted : Bool;
    timestamp : Text;
    previous_invoice_hash : Text;
    txn_hash : Text;
    due_date : Text;
    delete_comments : Text;
    payment_confirmation : Bool;
    tracking : Track;
  };

  let map = Map.HashMap<Text, Invoice>(0, Text.equal, Text.hash);

  public func CreateInvoice(invoice : Invoice) : async () {
    map.put(invoice.mongo_id, invoice);
  };
  public query func QueryInvoice(id : Text) : async ?Invoice {
    Debug.print(debug_show (map.get(id)));
    map.get(id);

  };

};
