class GrapheneObject {
  static const String KEY_ID = 'id';

  static const int PROTOCOL_SPACE = 1;
  static const int IMPLEMENTATION_SPACE = 2;

  String id;

  int _space;
  int _type;
  int _instance;

  GrapheneObject(String id) {
    this.id = id;
    List parts = id.split('.');
    if (parts.length == 3) {
      _space = int.parse(parts[0]);
      _type = int.parse(parts[1]);
      _instance = int.parse(parts[2]);
    }
  }

  ///
  /// @return A String containing the full object apiId in the form {space}.{type}.{instance}
  String get objectId => '$_space.$_type.$_instance';

  @override
  int get hashCode => objectId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GrapheneObject &&
          runtimeType == other.runtimeType &&
          objectId == other.objectId;

  @override
  String toString() {
    return '';
  }

  /// Returns the type of this object.
  /// @return Instance of the ObjectType enum.
  ObjectType getObjectType() {
    switch (_space) {
      case PROTOCOL_SPACE:
        switch (_type) {
          case 1:
            return ObjectType.BASE_OBJECT;
          case 2:
            return ObjectType.ACCOUNT_OBJECT;
          case 3:
            return ObjectType.ASSET_OBJECT;
          case 4:
            return ObjectType.FORCE_SETTLEMENT_OBJECT;
          case 5:
            return ObjectType.COMMITTEE_MEMBER_OBJECT;
          case 6:
            return ObjectType.WITNESS_OBJECT;
          case 7:
            return ObjectType.LIMIT_ORDER_OBJECT;
          case 8:
            return ObjectType.CALL_ORDER_OBJECT;
          case 9:
            return ObjectType.CUSTOM_OBJECT;
          case 10:
            return ObjectType.PROPOSAL_OBJECT;
          case 11:
            return ObjectType.OPERATION_HISTORY_OBJECT;
          case 12:
            return ObjectType.WITHDRAW_PERMISSION_OBJECT;
          case 13:
            return ObjectType.VESTING_BALANCE_OBJECT;
          case 14:
            return ObjectType.WORKER_OBJECT;
          case 15:
            return ObjectType.BALANCE_OBJECT;
          default:
            return null;
        }
        break;
      case IMPLEMENTATION_SPACE:
        switch (_type) {
          case 0:
            return ObjectType.GLOBAL_PROPERTY_OBJECT;
          case 1:
            return ObjectType.DYNAMIC_GLOBAL_PROPERTY_OBJECT;
          case 3:
            return ObjectType.ASSET_DYNAMIC_DATA;
          case 4:
            return ObjectType.ASSET_BITASSET_DATA;
          case 5:
            return ObjectType.ACCOUNT_BALANCE_OBJECT;
          case 6:
            return ObjectType.ACCOUNT_STATISTICS_OBJECT;
          case 7:
            return ObjectType.TRANSACTION_OBJECT;
          case 8:
            return ObjectType.BLOCK_SUMMARY_OBJECT;
          case 9:
            return ObjectType.ACCOUNT_TRANSACTION_HISTORY_OBJECT;
          case 10:
            return ObjectType.BLINDED_BALANCE_OBJECT;
          case 11:
            return ObjectType.CHAIN_PROPERTY_OBJECT;
          case 12:
            return ObjectType.WITNESS_SCHEDULE_OBJECT;
          case 13:
            return ObjectType.BUDGET_RECORD_OBJECT;
          case 14:
            return ObjectType.SPECIAL_AUTHORITY_OBJECT;
          default:
            return null;
        }
        break;
      default:
        return null;
    }
  }
}

enum ObjectType {
  BASE_OBJECT,
  ACCOUNT_OBJECT,
  ASSET_OBJECT,
  FORCE_SETTLEMENT_OBJECT,
  COMMITTEE_MEMBER_OBJECT,
  WITNESS_OBJECT,
  LIMIT_ORDER_OBJECT,
  CALL_ORDER_OBJECT,
  CUSTOM_OBJECT,
  PROPOSAL_OBJECT,
  OPERATION_HISTORY_OBJECT,
  WITHDRAW_PERMISSION_OBJECT,
  VESTING_BALANCE_OBJECT,
  WORKER_OBJECT,
  BALANCE_OBJECT,
  GLOBAL_PROPERTY_OBJECT,
  DYNAMIC_GLOBAL_PROPERTY_OBJECT,
  ASSET_DYNAMIC_DATA,
  ASSET_BITASSET_DATA,
  ACCOUNT_BALANCE_OBJECT,
  ACCOUNT_STATISTICS_OBJECT,
  TRANSACTION_OBJECT,
  BLOCK_SUMMARY_OBJECT,
  ACCOUNT_TRANSACTION_HISTORY_OBJECT,
  BLINDED_BALANCE_OBJECT,
  CHAIN_PROPERTY_OBJECT,
  WITNESS_SCHEDULE_OBJECT,
  BUDGET_RECORD_OBJECT,
  SPECIAL_AUTHORITY_OBJECT,
}

int getType(ObjectType objectType) {
  int type = 0;
  switch (objectType) {
    case ObjectType.BASE_OBJECT:
      type = 1;
      break;
    case ObjectType.ACCOUNT_OBJECT:
      type = 2;
      break;
    case ObjectType.ASSET_OBJECT:
      type = 3;
      break;
    case ObjectType.FORCE_SETTLEMENT_OBJECT:
      type = 4;
      break;
    case ObjectType.COMMITTEE_MEMBER_OBJECT:
      type = 5;
      break;
    case ObjectType.WITNESS_OBJECT:
      type = 6;
      break;
    case ObjectType.LIMIT_ORDER_OBJECT:
      type = 7;
      break;
    case ObjectType.CALL_ORDER_OBJECT:
      type = 8;
      break;
    case ObjectType.CUSTOM_OBJECT:
      type = 9;
      break;
    case ObjectType.PROPOSAL_OBJECT:
      type = 10;
      break;
    case ObjectType.OPERATION_HISTORY_OBJECT:
      type = 11;
      break;
    case ObjectType.WITHDRAW_PERMISSION_OBJECT:
      type = 12;
      break;
    case ObjectType.VESTING_BALANCE_OBJECT:
      type = 13;
      break;
    case ObjectType.WORKER_OBJECT:
      type = 14;
      break;
    case ObjectType.BALANCE_OBJECT:
      type = 15;
      break;
    case ObjectType.GLOBAL_PROPERTY_OBJECT:
      type = 0;
      break;
    case ObjectType.DYNAMIC_GLOBAL_PROPERTY_OBJECT:
      type = 1;
      break;
    case ObjectType.ASSET_DYNAMIC_DATA:
      type = 3;
      break;
    case ObjectType.ASSET_BITASSET_DATA:
      type = 4;
      break;
    case ObjectType.ACCOUNT_BALANCE_OBJECT:
      type = 5;
      break;
    case ObjectType.ACCOUNT_STATISTICS_OBJECT:
      type = 6;
      break;
    case ObjectType.TRANSACTION_OBJECT:
      type = 7;
      break;
    case ObjectType.BLOCK_SUMMARY_OBJECT:
      type = 8;
      break;
    case ObjectType.ACCOUNT_TRANSACTION_HISTORY_OBJECT:
      type = 9;
      break;
    case ObjectType.BLINDED_BALANCE_OBJECT:
      type = 10;
      break;
    case ObjectType.CHAIN_PROPERTY_OBJECT:
      type = 11;
      break;
    case ObjectType.WITNESS_SCHEDULE_OBJECT:
      type = 12;
      break;
    case ObjectType.BUDGET_RECORD_OBJECT:
      type = 13;
      break;
    case ObjectType.SPECIAL_AUTHORITY_OBJECT:
      type = 14;
  }
  return type;
}

int getSpace(ObjectType type) {
  int space = 1;
  switch (type) {
    case ObjectType.BASE_OBJECT:
    case ObjectType.ACCOUNT_OBJECT:
    case ObjectType.ASSET_OBJECT:
    case ObjectType.FORCE_SETTLEMENT_OBJECT:
    case ObjectType.COMMITTEE_MEMBER_OBJECT:
    case ObjectType.WITNESS_OBJECT:
    case ObjectType.LIMIT_ORDER_OBJECT:
    case ObjectType.CALL_ORDER_OBJECT:
    case ObjectType.CUSTOM_OBJECT:
    case ObjectType.PROPOSAL_OBJECT:
    case ObjectType.OPERATION_HISTORY_OBJECT:
    case ObjectType.WITHDRAW_PERMISSION_OBJECT:
    case ObjectType.VESTING_BALANCE_OBJECT:
    case ObjectType.WORKER_OBJECT:
    case ObjectType.BALANCE_OBJECT:
      space = 1;
      break;
    case ObjectType.GLOBAL_PROPERTY_OBJECT:
    case ObjectType.DYNAMIC_GLOBAL_PROPERTY_OBJECT:
    case ObjectType.ASSET_DYNAMIC_DATA:
    case ObjectType.ASSET_BITASSET_DATA:
    case ObjectType.ACCOUNT_BALANCE_OBJECT:
    case ObjectType.ACCOUNT_STATISTICS_OBJECT:
    case ObjectType.TRANSACTION_OBJECT:
    case ObjectType.BLOCK_SUMMARY_OBJECT:
    case ObjectType.ACCOUNT_TRANSACTION_HISTORY_OBJECT:
    case ObjectType.BLINDED_BALANCE_OBJECT:
    case ObjectType.CHAIN_PROPERTY_OBJECT:
    case ObjectType.WITNESS_SCHEDULE_OBJECT:
    case ObjectType.BUDGET_RECORD_OBJECT:
    case ObjectType.SPECIAL_AUTHORITY_OBJECT:
      space = 2;
      break;
  }
  return space;
}

String getGenericObjectId(type) {
  return '${getSpace(type)},${getType(type)}.0';
}
