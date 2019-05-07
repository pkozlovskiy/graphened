import 'package:graphened/graphened.dart';

class Call {
  static Map<int, int> apiIds = {};

  int id;
  int apiId = ApiType.API_NONE;
  String method = 'call';
  String methodToCall;
  List<dynamic> params;

  Call(this.id, this.methodToCall, this.params, requiredApi) {
    apiId = requiredApi == 1
        ? 1
        : requiredApi == ApiType.API_NONE
            ? 0
            : apiIds.containsKey(requiredApi)
                ? apiIds[requiredApi]
                : FallThroughError;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['method'] = method;
    data['params'] = [apiId, methodToCall, params];
    return data;
  }
}

abstract class Callable {
  Call toCall(int id);
}

class LoginCall extends Callable {
  final String username, pass;

  LoginCall(this.username, this.pass);

  @override
  Call toCall(int id) {
    return Call(id, RPC.CALL_LOGIN, List<dynamic>.from([username, pass]), 1);
  }
}

class RequestApiTypeCall extends Callable {
  final String requestedApiMethod;

  RequestApiTypeCall(this.requestedApiMethod);

  @override
  Call toCall(int id) {
    return Call(id, requestedApiMethod, [], 1);
  }
}

class GetAccountByName extends Callable {
  final String name;

  GetAccountByName(this.name);

  @override
  Call toCall(int id) {
    return Call(id, RPC.CALL_GET_ACCOUNT_BY_NAME, List<dynamic>.from([name]),
        ApiType.API_NONE);
  }
}

class GetFullAccounts extends Callable {
  final List<String> accountIds;

  final bool subscribe;

  GetFullAccounts(this.accountIds, this.subscribe);

  @override
  Call toCall(int id) {
    return Call(id, RPC.CALL_GET_FULL_ACCOUNTS,
        List<dynamic>.from([accountIds, subscribe]), ApiType.API_NONE);
  }
}

class GetAccountBalances extends Callable {
  final UserAccount userAccount;
  final List<Asset> assetList;

  GetAccountBalances(this.userAccount, this.assetList);
  @override
  Call toCall(int id) {
    return Call(
        id,
        RPC.CALL_GET_ACCOUNT_BALANCES,
        List<dynamic>.from([
          userAccount.objectId,
          assetList.map((asset) => asset.objectId).toList()
        ]),
        ApiType.API_NONE);
  }
}
