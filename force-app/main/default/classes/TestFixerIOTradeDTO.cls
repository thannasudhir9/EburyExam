/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-08-2022
 * @last modified by  : Sudhir Kumar Thanna
**/
@IsTest
public class TestFixerIOTradeDTO {
  // This test method should give 100% coverage
	static testMethod void testParse() {
		String json = '{'+
		'  \"success\":true,'+
		'  \"timestamp\":1649406735,'+
		'  \"base\":\"EUR\",'+
		'  \"date\":\"2022-04-08\",'+
		'  \"rates\":{'+
		'    \"AED\":3.990314,'+
		'    \"AFN\":96.106035,'+
		'    \"ALL\":121.440262,'+
		'    \"AMD\":520.8369,'+
		'    \"ANG\":1.963728,'+
		'    \"AOA\":476.632505,'+
		'    \"ARS\":121.672602,'+
		'    \"AUD\":1.455142,'+
		'    \"AWG\":1.955522,'+
		'    \"AZN\":1.847649,'+
		'    \"BAM\":1.956138,'+
		'    \"BBD\":2.200067,'+
		'    \"BDT\":93.951311,'+
		'    \"BGN\":1.955968,'+
		'    \"BHD\":0.409644,'+
		'    \"BIF\":2235.843042,'+
		'    \"BMD\":1.086401,'+
		'    \"BND\":1.483147,'+
		'    \"BOB\":7.491081,'+
		'    \"BRL\":5.164103,'+
		'    \"BSD\":1.089582,'+
		'    \"BTC\":2.4844189e-5,'+
		'    \"BTN\":82.746844,'+
		'    \"BWP\":12.589501,'+
		'    \"BYN\":3.552193,'+
		'    \"BYR\":21293.464735,'+
		'    \"BZD\":2.196346,'+
		'    \"CAD\":1.367231,'+
		'    \"CDF\":2184.753073,'+
		'    \"CHF\":1.015883,'+
		'    \"CLF\":0.031736,'+
		'    \"CLP\":875.693754,'+
		'    \"CNY\":6.913745,'+
		'    \"COP\":4084.108264,'+
		'    \"CRC\":715.079308,'+
		'    \"CUC\":1.086401,'+
		'    \"CUP\":28.789633,'+
		'    \"CVE\":110.282385,'+
		'    \"CZK\":24.514678,'+
		'    \"DJF\":193.982365,'+
		'    \"DKK\":7.437297,'+
		'    \"DOP\":59.928999,'+
		'    \"DZD\":155.638971,'+
		'    \"EGP\":19.924057,'+
		'    \"ERN\":16.296024,'+
		'    \"ETB\":56.026248,'+
		'    \"EUR\":1,'+
		'    \"FJD\":2.285824,'+
		'    \"FKP\":0.833225,'+
		'    \"GBP\":0.832581,'+
		'    \"GEL\":3.346561,'+
		'    \"GGP\":0.833225,'+
		'    \"GHS\":8.253801,'+
		'    \"GIP\":0.833225,'+
		'    \"GMD\":58.77634,'+
		'    \"GNF\":9724.322467,'+
		'    \"GTQ\":8.368296,'+
		'    \"GYD\":227.965937,'+
		'    \"HKD\":8.515153,'+
		'    \"HNL\":26.744462,'+
		'    \"HRK\":7.552558,'+
		'    \"HTG\":117.133543,'+
		'    \"HUF\":377.555951,'+
		'    \"IDR\":15604.578847,'+
		'    \"ILS\":3.501678,'+
		'    \"IMP\":0.833225,'+
		'    \"INR\":82.372954,'+
		'    \"IQD\":1590.286057,'+
		'    \"IRR\":45954.773742,'+
		'    \"ISK\":140.515374,'+
		'    \"JEP\":0.833225,'+
		'    \"JMD\":167.888011,'+
		'    \"JOD\":0.770313,'+
		'    \"JPY\":134.807188,'+
		'    \"KES\":125.266917,'+
		'    \"KGS\":98.814279,'+
		'    \"KHR\":4411.836098,'+
		'    \"KMF\":490.396384,'+
		'    \"KPW\":977.761516,'+
		'    \"KRW\":1331.79737,'+
		'    \"KWD\":0.331233,'+
		'    \"KYD\":0.908043,'+
		'    \"KZT\":495.398095,'+
		'    \"LAK\":12911.954311,'+
		'    \"LBP\":1647.474875,'+
		'    \"LKR\":343.226307,'+
		'    \"LRD\":165.677776,'+
		'    \"LSL\":15.926296,'+
		'    \"LTL\":3.207861,'+
		'    \"LVL\":0.657154,'+
		'    \"LYD\":5.110106,'+
		'    \"MAD\":10.606772,'+
		'    \"MDL\":20.032642,'+
		'    \"MGA\":4404.23483,'+
		'    \"MKD\":61.568299,'+
		'    \"MMK\":2017.4255,'+
		'    \"MNT\":3127.502393,'+
		'    \"MOP\":8.795506,'+
		'    \"MRO\":387.845064,'+
		'    \"MUR\":46.878046,'+
		'    \"MVR\":16.784705,'+
		'    \"MWK\":889.824464,'+
		'    \"MXN\":21.883142,'+
		'    \"MYR\":4.586241,'+
		'    \"MZN\":69.344996,'+
		'    \"NAD\":15.92663,'+
		'    \"NGN\":451.562864,'+
		'    \"NIO\":38.997507,'+
		'    \"NOK\":9.552134,'+
		'    \"NPR\":132.39609,'+
		'    \"NZD\":1.583502,'+
		'    \"OMR\":0.418281,'+
		'    \"PAB\":1.089672,'+
		'    \"PEN\":4.027235,'+
		'    \"PGK\":3.839341,'+
		'    \"PHP\":55.986065,'+
		'    \"PKR\":205.746928,'+
		'    \"PLN\":4.638727,'+
		'    \"PYG\":7506.55244,'+
		'    \"QAR\":3.955572,'+
		'    \"RON\":4.938782,'+
		'    \"RSD\":117.626316,'+
		'    \"RUB\":85.992993,'+
		'    \"RWF\":1108.514952,'+
		'    \"SAR\":4.072882,'+
		'    \"SBD\":8.708662,'+
		'    \"SCR\":15.661332,'+
		'    \"SDG\":486.164355,'+
		'    \"SEK\":10.279713,'+
		'    \"SGD\":1.480705,'+
		'    \"SHP\":1.496404,'+
		'    \"SLL\":12911.879442,'+
		'    \"SOS\":634.458332,'+
		'    \"SRD\":22.45369,'+
		'    \"STD\":22486.312688,'+
		'    \"SVC\":9.534503,'+
		'    \"SYP\":2729.040337,'+
		'    \"SZL\":16.032075,'+
		'    \"THB\":36.548167,'+
		'    \"TJS\":13.565639,'+
		'    \"TMT\":3.813268,'+
		'    \"TND\":3.243454,'+
		'    \"TOP\":2.450541,'+
		'    \"TRY\":16.026178,'+
		'    \"TTD\":7.395666,'+
		'    \"TWD\":31.377225,'+
		'    \"TZS\":2522.62355,'+
		'    \"UAH\":32.034745,'+
		'    \"UGX\":3862.608908,'+
		'    \"USD\":1.086401,'+
		'    \"UYU\":45.159535,'+
		'    \"UZS\":12380.671708,'+
		'    \"VEF\":232305423398.5784,'+
		'    \"VND\":24837.305651,'+
		'    \"VUV\":123.976423,'+
		'    \"WST\":2.848594,'+
		'    \"XAF\":656.066462,'+
		'    \"XAG\":0.044036,'+
		'    \"XAU\":0.000563,'+
		'    \"XCD\":2.936054,'+
		'    \"XDR\":0.793732,'+
		'    \"XOF\":656.066462,'+
		'    \"XPF\":119.232181,'+
		'    \"YER\":271.872106,'+
		'    \"ZAR\":16.000371,'+
		'    \"ZMK\":9778.870201,'+
		'    \"ZMW\":19.122615,'+
		'    \"ZWL\":349.820763'+
		'  }'+
		'}';
		FixerIOTradeDTO r = FixerIOTradeDTO.parse(json);
		System.assert(r != null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		FixerIOTradeDTO.Rates objRates = new FixerIOTradeDTO.Rates(System.JSON.createParser(json));
		System.assert(objRates != null);
		System.assert(objRates.AED == null);
		System.assert(objRates.AFN == null);
		System.assert(objRates.ALL == null);
		System.assert(objRates.AMD == null);
		System.assert(objRates.ANG == null);
		System.assert(objRates.AOA == null);
		System.assert(objRates.ARS == null);
		System.assert(objRates.AUD == null);
		System.assert(objRates.AWG == null);
		System.assert(objRates.AZN == null);
		System.assert(objRates.BAM == null);
		System.assert(objRates.BBD == null);
		System.assert(objRates.BDT == null);
		System.assert(objRates.BGN == null);
		System.assert(objRates.BHD == null);
		System.assert(objRates.BIF == null);
		System.assert(objRates.BMD == null);
		System.assert(objRates.BND == null);
		System.assert(objRates.BOB == null);
		System.assert(objRates.BRL == null);
		System.assert(objRates.BSD == null);
		System.assert(objRates.BTC == null);
		System.assert(objRates.BTN == null);
		System.assert(objRates.BWP == null);
		System.assert(objRates.BYN == null);
		System.assert(objRates.BYR == null);
		System.assert(objRates.BZD == null);
		System.assert(objRates.CAD == null);
		System.assert(objRates.CDF == null);
		System.assert(objRates.CHF == null);
		System.assert(objRates.CLF == null);
		System.assert(objRates.CLP == null);
		System.assert(objRates.CNY == null);
		System.assert(objRates.COP == null);
		System.assert(objRates.CRC == null);
		System.assert(objRates.CUC == null);
		System.assert(objRates.CUP == null);
		System.assert(objRates.CVE == null);
		System.assert(objRates.CZK == null);
		System.assert(objRates.DJF == null);
		System.assert(objRates.DKK == null);
		System.assert(objRates.DOP == null);
		System.assert(objRates.DZD == null);
		System.assert(objRates.EGP == null);
		System.assert(objRates.ERN == null);
		System.assert(objRates.ETB == null);
		System.assert(objRates.EUR == null);
		System.assert(objRates.FJD == null);
		System.assert(objRates.FKP == null);
		System.assert(objRates.GBP == null);
		System.assert(objRates.GEL == null);
		System.assert(objRates.GGP == null);
		System.assert(objRates.GHS == null);
		System.assert(objRates.GIP == null);
		System.assert(objRates.GMD == null);
		System.assert(objRates.GNF == null);
		System.assert(objRates.GTQ == null);
		System.assert(objRates.GYD == null);
		System.assert(objRates.HKD == null);
		System.assert(objRates.HNL == null);
		System.assert(objRates.HRK == null);
		System.assert(objRates.HTG == null);
		System.assert(objRates.HUF == null);
		System.assert(objRates.IDR == null);
		System.assert(objRates.ILS == null);
		System.assert(objRates.IMP == null);
		System.assert(objRates.INR == null);
		System.assert(objRates.IQD == null);
		System.assert(objRates.IRR == null);
		System.assert(objRates.ISK == null);
		System.assert(objRates.JEP == null);
		System.assert(objRates.JMD == null);
		System.assert(objRates.JOD == null);
		System.assert(objRates.JPY == null);
		System.assert(objRates.KES == null);
		System.assert(objRates.KGS == null);
		System.assert(objRates.KHR == null);
		System.assert(objRates.KMF == null);
		System.assert(objRates.KPW == null);
		System.assert(objRates.KRW == null);
		System.assert(objRates.KWD == null);
		System.assert(objRates.KYD == null);
		System.assert(objRates.KZT == null);
		System.assert(objRates.LAK == null);
		System.assert(objRates.LBP == null);
		System.assert(objRates.LKR == null);
		System.assert(objRates.LRD == null);
		System.assert(objRates.LSL == null);
		System.assert(objRates.LTL == null);
		System.assert(objRates.LVL == null);
		System.assert(objRates.LYD == null);
		System.assert(objRates.MAD == null);
		System.assert(objRates.MDL == null);
		System.assert(objRates.MGA == null);
		System.assert(objRates.MKD == null);
		System.assert(objRates.MMK == null);
		System.assert(objRates.MNT == null);
		System.assert(objRates.MOP == null);
		System.assert(objRates.MRO == null);
		System.assert(objRates.MUR == null);
		System.assert(objRates.MVR == null);
		System.assert(objRates.MWK == null);
		System.assert(objRates.MXN == null);
		System.assert(objRates.MYR == null);
		System.assert(objRates.MZN == null);
		System.assert(objRates.NAD == null);
		System.assert(objRates.NGN == null);
		System.assert(objRates.NIO == null);
		System.assert(objRates.NOK == null);
		System.assert(objRates.NPR == null);
		System.assert(objRates.NZD == null);
		System.assert(objRates.OMR == null);
		System.assert(objRates.PAB == null);
		System.assert(objRates.PEN == null);
		System.assert(objRates.PGK == null);
		System.assert(objRates.PHP == null);
		System.assert(objRates.PKR == null);
		System.assert(objRates.PLN == null);
		System.assert(objRates.PYG == null);
		System.assert(objRates.QAR == null);
		System.assert(objRates.RON == null);
		System.assert(objRates.RSD == null);
		System.assert(objRates.RUB == null);
		System.assert(objRates.RWF == null);
		System.assert(objRates.SAR == null);
		System.assert(objRates.SBD == null);
		System.assert(objRates.SCR == null);
		System.assert(objRates.SDG == null);
		System.assert(objRates.SEK == null);
		System.assert(objRates.SGD == null);
		System.assert(objRates.SHP == null);
		System.assert(objRates.SLL == null);
		System.assert(objRates.SOS == null);
		System.assert(objRates.SRD == null);
		System.assert(objRates.STD == null);
		System.assert(objRates.SVC == null);
		System.assert(objRates.SYP == null);
		System.assert(objRates.SZL == null);
		System.assert(objRates.THB == null);
		System.assert(objRates.TJS == null);
		System.assert(objRates.TMT == null);
		System.assert(objRates.TND == null);
		System.assert(objRates.TOP == null);
		System.assert(objRates.TRY_Z == null);
		System.assert(objRates.TTD == null);
		System.assert(objRates.TWD == null);
		System.assert(objRates.TZS == null);
		System.assert(objRates.UAH == null);
		System.assert(objRates.UGX == null);
		System.assert(objRates.USD == null);
		System.assert(objRates.UYU == null);
		System.assert(objRates.UZS == null);
		System.assert(objRates.VEF == null);
		System.assert(objRates.VND == null);
		System.assert(objRates.VUV == null);
		System.assert(objRates.WST == null);
		System.assert(objRates.XAF == null);
		System.assert(objRates.XAG == null);
		System.assert(objRates.XAU == null);
		System.assert(objRates.XCD == null);
		System.assert(objRates.XDR == null);
		System.assert(objRates.XOF == null);
		System.assert(objRates.XPF == null);
		System.assert(objRates.YER == null);
		System.assert(objRates.ZAR == null);
		System.assert(objRates.ZMK == null);
		System.assert(objRates.ZMW == null);
		System.assert(objRates.ZWL == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		FixerIOTradeDTO objFixerIOTradeDTO = new FixerIOTradeDTO(System.JSON.createParser(json));
		System.assert(objFixerIOTradeDTO != null);
		System.assert(objFixerIOTradeDTO.success == null);
		System.assert(objFixerIOTradeDTO.timestamp == null);
		System.assert(objFixerIOTradeDTO.base == null);
		System.assert(objFixerIOTradeDTO.date_Z == null);
		System.assert(objFixerIOTradeDTO.rates == null);
	}

}
