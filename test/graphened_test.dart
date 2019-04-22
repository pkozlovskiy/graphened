import 'dart:convert';

import 'package:graphened/graphened.dart';
import 'package:test/test.dart';

void main() {
  group("JsonSerializable object test", () {
    test('UserAccount', () {
      var USER_ACCOUNT_ID = '0.0.0';
      var MEMBERSHIP_EXPIRATION_DATE = 111;
      var NETWORK_FEE_PERCENTAGE = 222;
      var LIFETIME_REFERRER_FEE_PERCENTAGE = 333;
      var REFERRER_REWARDS_PERCENTAGE = 444;
      
      final userAccount = UserAccount(
        USER_ACCOUNT_ID,
        name: 'name',
        owner: 'owner',
        active: Authority(0, Extensions()),
        options: AccountOptions(PublicKey(), UserAccount('1.1.1'), 1, 1),
        membershipExpirationDate: MEMBERSHIP_EXPIRATION_DATE,
        registrar: 'registrar',
        referrer: 'referrer',
        lifetimeReferrer: 'lifetimeReferrer',
        networkFeePercentage: NETWORK_FEE_PERCENTAGE,
        lifetimeReferrerFeePercentage: LIFETIME_REFERRER_FEE_PERCENTAGE,
        referrerRewardsPercentage: REFERRER_REWARDS_PERCENTAGE,
        isLifeTime: true,
      );

      final userAccountJson = _encode(userAccount);

      final userAccount2 = UserAccount.fromJson(
          json.decode(userAccountJson) as Map<String, dynamic>);

      expect(userAccount.id, userAccount2.id);
      expect(userAccount.name, userAccount2.name);
      expect(userAccount.owner, userAccount2.owner);
      expect(userAccount.active, userAccount2.active);
      expect(userAccount.options, userAccount2.options);
      expect(userAccount.membershipExpirationDate,
          userAccount2.membershipExpirationDate);
      expect(userAccount.registrar, userAccount2.registrar);
      expect(userAccount.referrer, userAccount2.referrer);
      expect(userAccount.lifetimeReferrer, userAccount2.lifetimeReferrer);
      expect(
          userAccount.networkFeePercentage, userAccount2.networkFeePercentage);
      expect(userAccount.lifetimeReferrerFeePercentage,
          userAccount2.lifetimeReferrerFeePercentage);
      expect(userAccount.referrerRewardsPercentage,
          userAccount2.referrerRewardsPercentage);
      expect(userAccount.isLifeTime, userAccount2.isLifeTime);

      expect(_encode(userAccount2), equals(userAccountJson));
    });
  });
}

String _encode(Object object) =>
    const JsonEncoder.withIndent(' ').convert(object);
