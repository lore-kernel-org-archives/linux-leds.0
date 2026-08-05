Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71E736167B;
	Wed,  5 Aug 2026 03:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785900711; cv=fail; b=YiKCIDIOQIA3JTCWcMwKA4C+a0DnufwhD68Lo6JVbQw2cPqnpMJi4K7QMgIeeKc6/6OVAkV3IWm0GhzcAJC3H3CofDG/YtNIExbgxEuwiobkfbeUz0zfpXvIZv5SfEKSXKs8SbaxpsmcVEYE+LYyYZwnjjIo8D4CzMHW6tGmJGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785900711; c=relaxed/simple;
	bh=yxqWWTdWnxvTBtHU55mLuhMFvskQYOg1C+bNdPpr9pM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=atOQtriyuhDS2+oJeeNQzW4TMCxR/l4emr0zUlYYifqZtNTIsuG2d9kkCdPJax7vYtKamlwvarcWPLXdld3siWbJ2q8+iJP8zbu5N2He34Yih0JLpfywtDovVEHDqxEFpnNQzxuFZa4SNpORo0GyAImJPlQjDe7lGeLX8P2CzaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=gYvKqHLv; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="gYvKqHLv"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6752fZGX3535241;
	Tue, 4 Aug 2026 23:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=yxqWW
	TdWnxvTBtHU55mLuhMFvskQYOg1C+bNdPpr9pM=; b=gYvKqHLv/9K0ruR3vZM5k
	1htBNxUq50pl+E0uhIsFPOYkCVuPI/hf35c+8CJcAwCDT+i1qvzCZ02JNlkhgBq1
	HMxMWde2r9aVME0tP6HzXbTOedDJq3Zo5GxRQ6qiv1U6By276L6nUc2jIGbmVdfu
	DH1BbMUB8ccNXoeHEayuhlHxAtO2nzutm3QJJGrfCelt/ddrO7nVcaSrZf6omCRo
	Pi3cGYbqQpcSK9fw87BkNjGyP6BP3mUkWJ7p7k0PVZQTTELlCJgCUkUOhjM+GbtD
	StlOJ1DxSfVY2paTR8hJkfzCbbgefgNMy9VJT3RvTTDYcAGQO1zlND4WpuZix1AU
	Q==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013027.outbound.protection.outlook.com [40.93.196.27])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fue5bm1uu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 23:31:42 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPfa5BeOeXU9/divqzltOfZoUTHB8sQFtVQLpG6D2O++pm/jfbgkpvJp/d7T+yJlOngI8lDZj+dbBra/p+JcSGWQBym+pWUY/ANEKpwFb5fOtv7sQ5rcumwWmuH2kdU1ihjrguddfheTtGmvkZcLJvOAqV0bVPFQakvu5Nr8Lx1qM2bO7rQCxyLZshYZXOl+i2I1CNGcRK+Qillm57z0D8ZoIpNj70JZA1rYJ4bqvWvMujpXnTaezXE7ScWZRlZr24nBK+un725UzC/fPpzVwmCLp6bW11nafZmUV0bUQDbfOMIHO0FbB/4E836pFAmW5re6BOvsCVMfkBxiB/D49Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxqWWTdWnxvTBtHU55mLuhMFvskQYOg1C+bNdPpr9pM=;
 b=xgenGHSpZ70OpPjI+ktIiAO/t9DAfcoUlg8FIloNXU6wAIRnCmNSYHzYA0iDM8X1TwO7oBwob5pqNMFHcMaZMTP6nCGbLvqTVELE3ShNuf7z92ojmGJNJE5mKfIPr7tlwcbyym0k2wfINpqu6y0sjsqDpSGASqQsHF/HKVpUXg0S9AvW64JJMJ16Yr9f6CnKUH4qiUSxx4RVwwilFkLEn9u4pAG4G5lituYwyWnDWv5ccyhO+ov9bkatzeWuHaTlCi0vNFfDi9Ppdkh98vxL7XJoUGn8XvlGHYDOUoucuI5dY2oPDzpDyUHKCgS+NgKVxhfv6V7zs/DaliFqrY/IEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN8PR03MB4977.namprd03.prod.outlook.com (2603:10b6:408:de::11)
 by BY1PR03MB7970.namprd03.prod.outlook.com (2603:10b6:a03:5b5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 03:31:39 +0000
Received: from BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219]) by BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219%4]) with mapi id 15.21.0270.017; Wed, 5 Aug 2026
 03:31:39 +0000
From: "Roleda, Jan carlo" <Jancarlo.Roleda@analog.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "lee@kernel.org" <lee@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v8 2/2] leds: ltc3208: Add driver for LTC3208 Multidisplay
 LED Driver
Thread-Topic: [PATCH v8 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Thread-Index: AQHdH7AGlWeyMC2+JU2/l1jCu6vu+LaFIvaAgAmys8A=
Date: Wed, 5 Aug 2026 03:31:39 +0000
Message-ID:
 <BN8PR03MB4977AF444ECEA0C683D1000396D32@BN8PR03MB4977.namprd03.prod.outlook.com>
References: <20260730-upstream-ltc3208-v8-0-6bdcc35e65d7@analog.com>
 <20260730-upstream-ltc3208-v8-2-6bdcc35e65d7@analog.com>
 <20260729232249.A5CEF1F000E9@smtp.kernel.org>
In-Reply-To: <20260729232249.A5CEF1F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR03MB4977:EE_|BY1PR03MB7970:EE_
x-ms-office365-filtering-correlation-id: fe3a71e3-3c08-4d9f-b91c-08def2a20fa2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|4133799003|4143699003|38070700021|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 C2xWLg89wSENpE4tZ5lGeAf4ULI5LYmFQnn1jQoDnmXLCp95VpXiOk1zEWQNZ/Qc9Mwb+OY0lGgZUeMolT8SgOdyOXNBOa9lNgvjfJeioEYsxiN5xvlBKBVVnjRG8iA79F9DKfd6OhtoXSEIJkq3V2rs4IQlwmtyElY4gZGe53HRB5CfyxqbnPNdPlZ835KTBF4b6nRLlcaxCKyftGM89XXqR/PR5129IEc82DA58J6batx6ug8Li7TW2rn8K2H/qtJjkCCMgW+MLSAz2Yfcj/Xm0Fe//9um8F6lN4OsRLlx5ZzDFu1K4VBzmTVqFrr9So8c4z+NWRNvCa5lBPjlDeBW+FeIdy2GvMdEFLi8305j6cXgvD03uG0Gg0QMBLVx0oSVfEqZMI2UCb0/TuFOlkLIYkLyqp2ZPxztI8upZV1f8y0w9w1Ac3oaq04MgkKxpuMcVnbcNjq26qq/hlgUxFr146vtPI4aPGW3lm7mnpsEFi6+jKWDKjuTuRgOjEsQqs1sukd1CcFh1iAlqXCtJhS5hh2EWpKUhLTx67kkrH4D7dWz2CSaLRY21Sq+uzdaoP3LfVd6hu0jEvrBeGygbXVpja2VpynwPPEv6FAwYzUvJ8bEbLNfeIYOxG9cYA09GaeYBMjbLshLhDtuFlpN6vB/AZfGpSBVABX/SpdvFBw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR03MB4977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(4133799003)(4143699003)(38070700021)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WElKTm5uM0hISGZJQzFJTzd3UmhSZE1kWnBoOFVLMC96S3F1Q0pES2xUYU9M?=
 =?utf-8?B?R2FwdzRCd2NLUUhuRDJYUzNHeDZ5SHdWZjBSQisxdndsQUZNSEh0b0NpSkFL?=
 =?utf-8?B?V2UyNXR5VXFQZ1FSZ2dRWlRXeUFucjZUL1dOeXg3eVJ3eFhVRy8vK1lQN05X?=
 =?utf-8?B?RjB6N0J2MkVUNjIxejE1Vi9HVUQ2NGllbTl3V3IvY3hWUXVHWm9LK2FFK1d5?=
 =?utf-8?B?SythWlBUZWxUd3RKdFJ2WXNFaWFySW1hVXNqM3dEMmxqNVVSVERGYklVempj?=
 =?utf-8?B?K01CMm5xaE9paC9hYUV5bDJDblIrRVJzdHYyZ1RjWUVjVnhsWm8xRGVJWlNy?=
 =?utf-8?B?NElhY2V5Ri9GclVYVEZKS0R0dzFZK2hTNVcwcXNaK3ZjdnV2TlI5cDlyNm1x?=
 =?utf-8?B?cGkrTThyVUF1N2NCSG5MM0tMczFmejZoK2pqRmF3NnhQa3l5dHhyUmlxd09l?=
 =?utf-8?B?L1luYjNPV1BiZXN5ajFUR3MrOHNiZnArNUtXdWs2NDgvUURuTElRL25URlJU?=
 =?utf-8?B?Z003SG5CUXZjeVMyTlpkbVZiYmM3bm9TaWYwdjVQcHp2SUZLYlhYb3J1SFIr?=
 =?utf-8?B?Rk0rVE1FWlVoU0cwVmJrbFRwY3F6c2tnTnBPTk9NUGhvS3FYZnJKdVJsbzdx?=
 =?utf-8?B?UDRQS2pvS1dMdG1rbGNNQWREaFVqbmd5Z1gzcUJWL0syTFNWVVJrNHF5TGxG?=
 =?utf-8?B?MzVndjlUWE16Ui9WMERHNDFSa1F4Z2hBRTJmSjBVdWs1NUtQR2lhNVJ2d090?=
 =?utf-8?B?anZpV1FXai9xdjNiZ3padnFYNERLSU9EbklNTmx5c28wdi9tYzAxMkxPZHhL?=
 =?utf-8?B?Q0p2Z3B0Y1UwQjVqbmhEeXd6MVRkZHdFb2hleUF4c0N2bmNnN3FVZER4aGtD?=
 =?utf-8?B?K09pZ0FKSWk4RC9TS2UzaG1jQzh1ZTAxSGhDdjVzeGIzMkxIWHVYTktGclVi?=
 =?utf-8?B?cXJjbjJHYU0wWkw3Z3U3NklXU3E4angvTm9aZFBpaDJhK295R0xFMUROZm5w?=
 =?utf-8?B?cm02cERKYjYwMUw2WGliQ0MzTU01VzE3QUZjSTJXQ0M0QVZZUWs0S2VLcE14?=
 =?utf-8?B?dE9GYkdwRTJUSitxR1pFdEM0L3VvSlBMWWoyQ0MwNm9UNGZlSkdoTVhFUDk4?=
 =?utf-8?B?c2tqWnpWUjNIZSt3THJKQk9ITFZoSURvR1J3VnBiUHUrbHU2Rmh0K3BuSG9O?=
 =?utf-8?B?aDRpcTFCMVkxNWcyd0IwdS9lZi9xRUppVytPZGhaRnp2aDZhM2VXVXIrbHNq?=
 =?utf-8?B?RDhQbHoyWlRrWnRIQTgxL21Mci91Sll6VXllWFQraGMzK051K2JscGFOZFU4?=
 =?utf-8?B?UVpHVnpYSXRPbTNleDd0djZQb1ZDNmltZ2ZuQUpvMXAybzZVVTViV0ZWdzJi?=
 =?utf-8?B?UGlEVTV3MDE1ZU9JV2pPUUNYeFE0WTRrK2loNGw2QktDWmEwZlBjOWpyRE1R?=
 =?utf-8?B?TGUxYU5QV0dscFhHQUVrcW9kdmdwclBIRXdDczRFN1FaS0dtZGU0VmpaK2ds?=
 =?utf-8?B?U3BQZnI1QVoxcFhzMHpkK0xod09FMjZzZGN0TnhVVkNWRGNlajRtbmNmeWh2?=
 =?utf-8?B?eDFaZDJic2lpQkhaSFZjZGMvdXVEbUhxazBPYWtmek1wZm9pWUY5aFdNZm80?=
 =?utf-8?B?clZMMGIxQnpXVUNJME5PeGRnS3JOempkS0l0eUQrTExyMUtGeE0xRzV5WW82?=
 =?utf-8?B?eFhUazJmVEI2NGdybFBGQVZQRzJDVm5ZL0h3UjVhTVlwa1dPNFBPRlBHVTMw?=
 =?utf-8?B?aWVWS1NGcEgvK0plclNOSXhrRUlkd3BzamNja3Y3cjBwbE9hR3hIbFZRYUg4?=
 =?utf-8?B?UzZodTJvQ05CNCtWOTl4amU5Y3hadE0rTmJIalVvdW42bDFZa1ZlOE52Qmtu?=
 =?utf-8?B?ZFZIU1lEMHBvaW5Na3NydDl4NVY4VFllZ0YzWFRJUEwvTUpMQ0lCdWNqUllW?=
 =?utf-8?B?ZXQra09MckUvWGdmeGx5N2Y0MnRFSEZJZ1RKd1BQVWp2elQ0aU9HUHpvd0tj?=
 =?utf-8?B?WHA4TTNFSjJ2T2tiWmxmd3ZKbDV5RVlMRng4NGJKNVNmWGdLbjh1dXE5UWQw?=
 =?utf-8?B?eFVaR090MTZjcUdnZ0NsbmN4R0daZUJOS2JEdWhCZVkvSXdvYjVYcG1ablJZ?=
 =?utf-8?B?N1d0VCswUmQzMUROT0NJQ3FkOU5PbW9waWk5bXJnNW43TnlzTlhIODZORmJt?=
 =?utf-8?B?VjZadmpzTzJ6WGt4VkJyRXlld0tnUFFxSXR3ekdxbHJjK0ZOSXltdEV1UTd6?=
 =?utf-8?B?SnNGRDVyb09TTjFOdkJsdmJrb0ozc1NhRWhhanozSHpzUjBRUHY1bUhRWnE4?=
 =?utf-8?B?ZmtiVzZ0elFscE1tbUJVVGxjbmwxaHZaTERiVTZGOGNHNG1sb01jUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	gesZDH6FZd3VWvGHX6eB/AwrOPuSOmkcyklwQlbeRAZgUKv4TMb/mrzbqXVIEuqn/DqcLP5PQzt60TcxiD4yntWK+d9wV9VwNkeTe45aItuDvRbEZWIvzcYJSuqhx+DdTyAAmw5ijbuW3LYMuaGlHFDm53gIyCWW05QsDnycKZ06YIU7lwgegCwHPReM4CBzqE/LaylwweGXQROG0Ql7LN8iG4sjb221bXk/rXnU9ZmudLyyIdc7t7NCBINf07smJBLLXQfcjf/OWbRMwqNirGYrKIpfijP/tL4mTz5lzZlh2GGsri33iMl/z0DoQhMAJBIhj2RzDnew90DRcsLzPQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR03MB4977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3a71e3-3c08-4d9f-b91c-08def2a20fa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 03:31:39.3148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IsMyEegFV07v0Dyn9FJlUU6vjZ4myyHrIuANVyZVPWqQwhQb66M8soT9RjC2TVs9IwkavzIyL8iLufaZDoN6PZhyrEKqdD+4OGOLzNn20AE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7970
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDAyNCBTYWx0ZWRfX4GTLeDo3gIIC
 Gzk10+Ma6F7LExVruPQqQQ8epgF26ZkpbXWLK/WHvE9inO1FG0gvynX7lBnGzLrcB9h3GgvJgr7
 ddiHkNb3evLHFjprizjnLmvq6Cyz6zHH69czmkvivYC7NZvMpH+Y
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=6a72ae9e cx=c_pps
 a=Fmy/MLZGwmeCELFTjYB8og==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=Z0pTeXoby7EwIRygza74:22 a=uherdBYGAAAA:8 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=bq-2BN6cG2xf5EtIBxAA:9 a=QEXdDO2ut3YA:10
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: xwIDvaRfNyc81uxEF5VnLGtOd9W9VmKF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDAyNCBTYWx0ZWRfX1iPVSvhuQ6Sj
 68QbJqD0Mf0nhhSbfKoZXB2XZsyltBl5zHLbiuMdeH2UVJehz5TNMUEy4kB/rgq0+8NpVqyL2s/
 P9S70Okqe3lRJTMpvj+PPuJmtLHv9DQlKTcxCasGpLzHpRSOTPvmtd5gxS9zyvtiNHi0Ie/Ydkr
 ZjKPyDuWSAJ/lpoEKo6IbW2Zo9CvdjbNm+yjSkKFZuNnK88GL93kX+VR1pHn5v4aPWxamjYUTbX
 0vh8XoNcjyfzz7ahDZkDRVtL8hQPV2qpMiLqV+DNreBl43Ie+qWHGvvmz2FF8Cu7hS8XUNYFNCT
 8dDmPQ8XrFIuDPyIBBABHNAqCpdjYb/ciIPWPU+sV5o3XmzAwE+L3AdhRoIyJQfBJxmnPbBILmb
 4zNIrsPmAhJeYUgC4WmWDVA6JeoH1oZrs6Rjwu+DYUNt4fvwYLzkTqLJGWatD9L1YAkiJxIANhy
 loh+FYJMei6Dj6KVMzg==
X-Proofpoint-GUID: xwIDvaRfNyc81uxEF5VnLGtOd9W9VmKF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_01,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501 clxscore=1011
 bulkscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050024

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBzYXNoaWtvLWJvdEBrZXJuZWwu
b3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgSnVseSAzMCwg
MjAyNiA3OjIzIEFNDQo+IFRvOiBSb2xlZGEsIEphbiBjYXJsbyA8SmFuY2FybG8uUm9sZWRhQGFu
YWxvZy5jb20+DQo+IENjOiBsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZzsgcm9iaEBrZXJuZWwu
b3JnOyBjb25vcitkdEBrZXJuZWwub3JnOw0KPiBsZWVAa2VybmVsLm9yZzsgZGV2aWNldHJlZUB2
Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OCAyLzJdIGxlZHM6IGx0YzMy
MDg6IEFkZCBkcml2ZXIgZm9yIExUQzMyMDggTXVsdGlkaXNwbGF5DQo+IExFRCBEcml2ZXINCj4g
DQo+IFtFeHRlcm5hbF0NCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNh
c2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpDQo+IHRvIGNvbnNpZGVy
Og0KPiAtIFtNZWRpdW1dIFJlZ2NhY2hlIGRlc3luY2hyb25pemF0aW9uIGxlYWRzIHRvIGluYWJp
bGl0eSB0byB0dXJuIG9mZiBMRURzIGxlZnQNCj4gb24gYnkgYm9vdGxvYWRlcg0KPiAtLQ0KPiAN
Cj4gLS0tIFBhdGNoIFsyXTogW1BBVENIIHY4IDIvMl0gbGVkczogbHRjMzIwODogQWRkIGRyaXZl
ciBmb3IgTFRDMzIwOCBNdWx0aWRpc3BsYXkNCj4gTEVEIERyaXZlciAtLS0gY29tbWl0IDQzOGUz
OWRkYThjNjBlNzNmZTQwYWJhZDZkMzUzMzFmZDhiYjRiODANCj4gQXV0aG9yOiBKYW4gQ2FybG8g
Um9sZWRhIDxqYW5jYXJsby5yb2xlZGFAYW5hbG9nLmNvbT4NCj4gDQo+IGxlZHM6IGx0YzMyMDg6
IEFkZCBkcml2ZXIgZm9yIExUQzMyMDggTXVsdGlkaXNwbGF5IExFRCBEcml2ZXINCj4gDQo+IFRo
aXMgY29tbWl0IGFkZHMgc3VwcG9ydCBmb3IgdGhlIEFuYWxvZyBEZXZpY2VzIExUQzMyMDggTXVs
dGlkaXNwbGF5IExFRA0KPiBkcml2ZXIuIEl0IHN1cHBvcnRzIDcgZGlzdGluY3QgTEVEIGNoYW5u
ZWxzIGFuZCB1c2VzIEkyQyBmb3IgY29uZmlndXJhdGlvbiwNCj4gdXRpbGl6aW5nIHJlZ21hcCBm
b3IgcmVnaXN0ZXIgYWNjZXNzIGFuZCBjYWNoaW5nLg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9sZWRzL2xlZHMtbHRjMzIwOC5jIGIvZHJpdmVycy9sZWRzL2xlZHMtbHRjMzIwOC5jDQo+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZHJp
dmVycy9sZWRzL2xlZHMtbHRjMzIwOC5jDQo+IFsgLi4uIF0NCj4gPiArc3RhdGljIGludCBsdGMz
MjA4X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpIHsNCj4gWyAuLi4gXQ0KPiA+ICsJ
cmVnbWFwID0gZGV2bV9yZWdtYXBfaW5pdF9pMmMoY2xpZW50LCAmbHRjMzIwOF9yZWdtYXBfY2Zn
KTsNCj4gPiArCWlmIChJU19FUlIocmVnbWFwKSkNCj4gPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9i
ZSgmY2xpZW50LT5kZXYsIFBUUl9FUlIocmVnbWFwKSwNCj4gIkZhaWxlZCB0bw0KPiA+ICtpbml0
aWFsaXplIHJlZ21hcC4iKTsNCj4gDQo+IFtTZXZlcml0eTogTWVkaXVtXQ0KPiBEb2VzIHRoaXMg
Y29kZSBuZWVkIHRvIHN5bmNocm9uaXplIHRoZSByZWdpc3RlciBjYWNoZSB3aXRoIHRoZSBoYXJk
d2FyZQ0KPiBkdXJpbmcgaW5pdGlhbGl6YXRpb24sIGZvciBpbnN0YW5jZSBieSBjYWxsaW5nIHJl
Z2NhY2hlX3N5bmMoKSBvciBleHBsaWNpdGx5DQo+IGNsZWFyaW5nIHRoZSBMRUQgREFDIHJlZ2lz
dGVycz8NCj4gDQo+IElmIHRoZSBib290bG9hZGVyIG9yIGZpcm13YXJlIGxlYXZlcyBhbnkgTEVE
cyBwaHlzaWNhbGx5IHR1cm5lZCBvbiwgdGhlDQo+IHJlZ21hcCBjYWNoZSBpcyBzdGlsbCBpbml0
aWFsaXplZCB3aXRoIGEgZGVmYXVsdCB2YWx1ZSBvZiAwIGZvciB0aGUgTEVEIERBQw0KPiByZWdp
c3RlcnMgKHZpYSBsdGMzMjA4X3JlZ19kZWZhdWx0cyksIGJ1dCB0aGUgaGFyZHdhcmUgaXRzZWxm
IGlzIG5vdCByZXNldCB0byAwLg0KPiANCj4gSWYgdXNlcnNwYWNlIGxhdGVyIHRyaWVzIHRvIHR1
cm4gb2ZmIHRoZSBMRUQgYnkgc2V0dGluZyBhIGJyaWdodG5lc3Mgb2YgMCwgd2lsbA0KPiByZWdt
YXBfZmllbGRfd3JpdGUoKSBzZWUgdGhhdCB0aGUgcmVxdWVzdGVkIHZhbHVlIG1hdGNoZXMgdGhl
IGNhY2hlZCB2YWx1ZQ0KPiAoMCkgYW5kIG9wdGltaXplIGF3YXkgdGhlIEkyQyB0cmFuc2FjdGlv
bj8gVGhpcyB3b3VsZCBsZWF2ZSB0aGUgTEVEIHBoeXNpY2FsbHkNCj4gb24gd2hpbGUgdGhlIGtl
cm5lbCBhbmQgc3lzZnMgcmVwb3J0IGl0IGFzIG9mZiwgcmVxdWlyaW5nIHRoZSB1c2VyIHRvIGZp
cnN0IHNldCBhDQo+IG5vbi16ZXJvIGJyaWdodG5lc3MgdG8gZm9yY2UgYSBoYXJkd2FyZSB1cGRh
dGUgYmVmb3JlIHRoZXkgY2FuIHN1Y2Nlc3NmdWxseQ0KPiB0dXJuIGl0IG9mZi4NCj4gDQoNCk5v
dGVkLiBJJ2xsIGluY2x1ZGUgdGhlIHJlZ2NhY2hlX3N5bmMoKSBkdXJpbmcgcHJvYmUgdGltZSB0
byBlbnN1cmUgc3luY2hyb25pY2l0eQ0KYmV0d2VlbiBkcml2ZXIgYW5kIGhhcmR3YXJlLg0KDQo+
ID4gKw0KPiA+ICsJZGlzYWJsZV9jYW1obF9waW4gPSBkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29s
KCZjbGllbnQtPmRldiwNCj4gPiArImFkaSxkaXNhYmxlLWNhbWhsLXBpbiIpOw0KPiBbIC4uLiBd
DQo+IA0KPiAtLQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtw0KPiBodHRwczovL3VybGRlZmVuc2Uu
Y29tL3YzL19faHR0cHM6Ly9zYXNoaWtvLmRldi8qL3BhdGNoc2V0LzIwMjYwNzMwLQ0KPiB1cHN0
cmVhbS1sdGMzMjA4LXY4LTAtDQo+IDZiZGNjMzVlNjVkN0BhbmFsb2cuY29tP3BhcnQ9Ml9fO0l3
ISFBM05pOENTMHkyWSEtMEExXzktQy0NCj4gcVFYcGFXSWZmQWk0YUw2a1RBVVVETlB6VmJtUHVL
WlgtDQo+IHlqVGF2SGlFbWVEQ0dGWDJINE9kdFRLNER0VjB1eWJVR1lHQy1DT21oOEstSUdzQSQN
Cg0KUmVnYXJkcywNCkNhcmxvDQo=
