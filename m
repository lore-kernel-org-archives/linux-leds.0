Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010020.outbound.protection.outlook.com [52.101.84.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9096F33A9D1;
	Mon, 14 Sep 2026 19:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789415196; cv=fail; b=JDBmr8Kl4+K44ZlRJ17W1n+GXSNzqbVZJsOdjSrI6gpxY2ww2d/CIFTVDyZf/uLrZ2egmBexXgaD85qLdu0ELaVtL48kD7Yje1LGQVKY865Qu7PSfbTMVUbWsEqbfGJw13To8V71mt3LGOaH9MRf/utLxZcfkSZw801LxejHWKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789415196; c=relaxed/simple;
	bh=q7lVS/a3XiWpVthCsRnQSid3WbuxTsBM/52JWv19nUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=khY0AHZjSlP7BWgEPaey9eL5778RtIeT7NOEQqprvbS1pWdWAyoz/tR0Ni1QzTgp0moP/d4J3v+xt1Iu6Op3PGBGDpk7KyfwXUvR7himYtlexTL+VXU/Vhg5f3mOOOUhUyd4xtqfeTA38GKI4HrmeF1R9mvYBs/Ma2bXeFQmtao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GRVQsYGz; arc=fail smtp.client-ip=52.101.84.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GRVQsYGz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0Xl1I67pMObVCtLLXVQfj/5aUo+eyLapLwFeo7tXBMyzpIbba2HM4pCmBsRCgdscBr/126c0oallTjbbSm3XlEjMQuv4yrYnYox7RcwcBP1f+cd98Qrss5TAXPgFt6zaZNBs2oDaIXGTONO1Vr2Odz31Q6EBJQ62lfj+j+soeGtXp5elPSB600WPbFgLfOao7unmKH1LRWmZZnP4xf7c99Z1LdmB+/n8dRqQ0yNwJlIZBg5v6YHyU2AVxmMM88CLqQfPdEf7E5x1oh4sWybT9aYlG0JUGqbxmbrPL8DJyhwiYkyWpN38h3RJEyx6GB045LDJKUq0Ub2Aa9ZTthm5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGYfC5kkANmd3BmUroED4yVyMWwdmcZ0ZBenZN7F0NY=;
 b=bbjENznF1dUT4B/czbvXEpQtgAXKuiXHRyLYPCm9rv28tDO631tPd1HTXBtyD25Q+eKqh+d5pvyZTe5eIZDRFTE/3J6NaaaZ78YF6jhkBcN5H1cEN8qxuk/NqnzsONEfSXrxXbOMNUlApWv5FeJtG0LQZi1aTErn7AUnDAXCoLTkEj4e99UJ1v1shdl+8iG94QyFbXaG0oaxLgcraMv8DYgbPB1UM0IVhJTRaBt59Kr0USuFnKY3lZ0qEx9Qu7ltifmLWE9yRU24PG97yfKm2Sf7D4IW3gtW0jofuMbUF7hWEDgYGKa9vawRC3AZzfcjnS04IXj1JD0fp4wsanL0QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGYfC5kkANmd3BmUroED4yVyMWwdmcZ0ZBenZN7F0NY=;
 b=GRVQsYGzIfhXfDQBQGOT7XX+AgnTXROF0dXG29Yl6egKhMm4PTA9c4MYejkYKKWwaVmyE7GasWiGj6k3nTBnkK2qoqBpRF/Hf8wDrcxyL+moa7DI69lKCLgAN8F7JHJu5teu7tlCyKofLv0CgoQycvuy4SnndHVlMFohMu8V8g2fU5wCdaKAcEIYLtW9ftCZLZYV+UTNcAyBatXEbupMjccMmpOyxs/JaYINRe8V1reaWiLmtFKwsNtII1D7tymxU+0EYGQsTNLbiKxQagB8jwXMvJIPXok9YN7LTUgnvrrlMwqIbQOM4PquZiJXvWaVnqGnUF5O0E84MLsQEdXjQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8732.eurprd04.prod.outlook.com (2603:10a6:20b:43f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 19:46:30 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 19:46:30 +0000
Date: Mon, 14 Sep 2026 15:46:22 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: haibo.chen@oss.nxp.com
Cc: Riku Voipio <riku.voipio@iki.fi>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH] leds: pca9532: check i2c_smbus_read_byte_data() return
 value
Message-ID: <aqhPDjtGTvYUNZii@lizhi-Precision-Tower-5810>
References: <20260727-led-fix-v1-1-d635c5037109@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-led-fix-v1-1-d635c5037109@nxp.com>
X-ClientProxiedBy: PH7PR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:510:33d::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: c6e921f7-1d87-4e55-eae8-08df1298df31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	v6/qL/scmwEugY4GyfSSSWlC7uPra4s7r8q11nZZi5/+epPeuusqNF9hj5BdOpqfoFKTgiqQhheW9E866BasdRrpRZrpSmLmqpSBWsazmXsFA3sIlUpdSso2oq+7EgX7f8jLnuGfcKVYYli0zNjpL2cE/ezUnreHoNiyhiCSwMuMba96NHtIugbK7HB7iYD3XYPRiS38Ysk1EjzBrs4aJTpKf/9sialAXqYjNrnLMdq3f0BWh0zZjeLYBOMyOI5juMqHIPrixs68OL4wNjXfvLnGK+3BIf1WfeHrI6DIiqIASJNBpuJLZkmcxUduGIVK9DV9dZ247dT81b5i3/jjc/8BVGy25bbqtPfsbJUdFlh4WtEzOUyTa9DZ9R/J7++A+ASk4tBmBC8kXFmmuX/h5UJvvXO4c15ay6v4eB1Ko0p9540UQs6uWMr5VQ6VrEvB3rSl/HNEm+KNC6z4EmP1xqLXckXPUibfVUI27qBzST+cypHqYPZtObbOqRYFD9RqO4lmCiRNB3K7AZKqJ6UTmO9EbpT+XxVqUyAUezZkX++msDiTSQCvH/Z1IgDYyKHkjhyQnp4w0hNhm/zzzUz7roCEL0tYpmy52+VBM7u0fV4ynGgfNQOgzxe2mh/HqxJcZLZUszpd79wZK+BYXtrvaHw6ROIyJx3MpMFZupUCoD0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K8UHTVFBqHeXFGF0a1ZAZFsrWBI8kcgs9mGTR52STJh7bShCseF+nL3l42kZ?=
 =?us-ascii?Q?WCPvN+oHF6kkXbb7R/KHyQ3CPu1UWXOpe+AbizDAgecFWDZWVHkHWW9uj4Vu?=
 =?us-ascii?Q?6Vs0lETk1Z0c0ViGSekw8g1aMDKOjtIkI7U6cf63L7q1b0DgcW3qModdF2Q3?=
 =?us-ascii?Q?5JukvlbjTNTTf/99Nn/PIZuZHvlm4tWaQHQMI3Mk2Or5ZkICyjlHJO/h5Xle?=
 =?us-ascii?Q?KWvK34YZnI3LU462qW7jUV4ZIq02ffQwlnq3r3yPevfiOsrvDVe+GNn+/jGQ?=
 =?us-ascii?Q?JWAjUWx+JMN/E0OSVZeZacaV84p2UQyhEug+Fl+Bnud5KlxBTS4uq1WAW4jS?=
 =?us-ascii?Q?hWZqA9kl4zua5RTHbNcobaxYc2hwlXcpBEbysyoxzoxokvJ7xI9DoG92aYy4?=
 =?us-ascii?Q?S8497CU12dBQOj/cFsckcYfM9slgOq/jW1ct/3riSEm+zsKn1S73jDvbN6Zc?=
 =?us-ascii?Q?ycOMbNRm95YT3wW+/NzD1iPwQRDGl3W8EO5S1TMMFHa0epomFfUwjIQP6pOD?=
 =?us-ascii?Q?/9RaEiJkMON7kKnsCkIiWr2KsaHDchdNe/6ijC0oO4NDd5IdAOIyHSgiHkQR?=
 =?us-ascii?Q?YvMwWle/pfrgQuKRXF6tztFkiEPN6Zioio+BiHTFxHWx4lt+ZorUrJR6CCRI?=
 =?us-ascii?Q?I+Mu9uK1GBcOtLbArgVQq2sckfA3gbFbu4rD7kJp7EhdmLjhlo+wFlVeDKsX?=
 =?us-ascii?Q?EM1S0gxvTO0wjMmFKuyC8P29xJaJPczaUagVwkrzL+NpMGXxDbTTdPK8mPUD?=
 =?us-ascii?Q?xwB8SgWJ3PrBFboRBqORdAFZMzs87VMKGkB6PMGwWGEIDKEMrCGt9ZR3g7Ek?=
 =?us-ascii?Q?PZNs9JuKAZ8PFKUGc4/hHKpF9WRRfzWoRxAsnQJchKV+oqGycN1oqgcrUt4J?=
 =?us-ascii?Q?23iRjI04WdHePzfq+XZcjxAAg8/QWboNaBhMDn7TWqH7ABnwip2KG8GxYcJu?=
 =?us-ascii?Q?WnlouP1SRCjWyx4zlPO6gzrlhXyPkMhSSXOnYlerEyIEuNAj7Q/EWuIIlfgn?=
 =?us-ascii?Q?xm7Z2pYTCC/cHAVjxa4yKNczmmBI3ioeIL9oYebdGPB1ytvBeA5PGQdjTctr?=
 =?us-ascii?Q?xJ4XJt1n/tn2uYK+BrFi1CI6qxRFB+fD/KR0PWXme3vMa3L+6yaZfNvAglYs?=
 =?us-ascii?Q?a2fsDPpG06LEEPpfuf5H3JiSeyUu6mHu5UpsFDpj4wlNlcaCk7tY4syfIReH?=
 =?us-ascii?Q?lLEsg6gqr7vhGKdu5FcnW09Osry7IgINoycohLBHPgwKoCsaSo1Z2Jd5nWjl?=
 =?us-ascii?Q?3H3RKIo1dYcXGnm/LhuQDYR1b0SHhbFmIg9Fps2tq0WBY1Yu3KEEK0XrEaty?=
 =?us-ascii?Q?GesGBOmcAB/4bo8OR+B0nqLCMC6lrXp5A/4EztOm4sdHLPwMHY1jdm4s5s/M?=
 =?us-ascii?Q?iJ0AFxLnB3hOCxj12OpFHghyXJ8Yr1/xW/92iM4ih8N5SUkTRbBKy81O2xgW?=
 =?us-ascii?Q?eDYIFpKMjdzTcqOKTDQDzNIcG4PyGyylu7rfwydFTbub4BPPDByB/yeQfomU?=
 =?us-ascii?Q?2SbwqKEaPKI4l7VKar3PUH6xXdjenUrPdvHYGjWM9h5zXkCj9vCp+2B5PvY+?=
 =?us-ascii?Q?b8AxN3/3/gaCk4NKbFZ7iHQCuCPscIR9DLrHklBosonz6ElFUq8H9mFLiolQ?=
 =?us-ascii?Q?zcgt8HLAPY7h/5Ugeck473PUumP8sj4mGAXSRLwRqp1JlN9QXfkW98IsELFO?=
 =?us-ascii?Q?jedZ8koiL9ZMGWN+/KA6tY0DeVy3rtiS/F8lJxwizlOECkRisdt5aIVLgAac?=
 =?us-ascii?Q?CUAR8rKTygpZ/3xnRKXhE0/s4bJFEcVuF/8rGagoO/gv61GHH2tm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e921f7-1d87-4e55-eae8-08df1298df31
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 19:46:30.0494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzrie3IkjE9qCidLLFt4kaCXTNwqe+HaMKUxnQ32+2QkJP8DTxf6Hr6KqpRdEHna6WW26prmXxEAmTnQkZ0sAbOZQOVsmSKMyp32mLDxjWtCnSYmtdSxmk1yI0x8LN55
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8732

On Mon, Jul 27, 2026 at 05:57:54PM +0800, haibo.chen@oss.nxp.com wrote:
> From: Haibo Chen <haibo.chen@nxp.com>
>
> Coverity report INTEGER_OVERFLOW (tainted_data_return ->
> cast_underflow -> overflow) in pca9532_getled().
> pca9532_getled() stored the return value of i2c_smbus_read_byte_data()
> into a char and used it directly to compute the LED state without
> checking for an error. i2c_smbus_read_byte_data() returns a negative
> error code on failure. On an I2C read error the negative value was
> assigned to an unsigned type, triggering an integer underflow/overflow,
> and a meaningless LED state was returned to the caller.
>
> Read the value into an int, check for the error, and fall back to
> PCA9532_OFF while emitting a warning when the read fails.
>
> Assisted-by: VeroCoder:vero-1 [cli]
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/leds/leds-pca9532.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index 2d37e00e459dee9f0313830f4852b01f40977311..e8ee17b8bd547a92372a8e74a6781b95ae831fe2 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -298,12 +298,15 @@ static enum pca9532_state pca9532_getled(struct pca9532_led *led)
>  	struct i2c_client *client = led->client;
>  	struct pca9532_data *data = i2c_get_clientdata(client);
>  	u8 maxleds = data->chip_info->num_leds;
> -	char reg;
> -	enum pca9532_state ret;
> +	int reg;
> +	enum pca9532_state ret = PCA9532_OFF;
>
>  	mutex_lock(&data->update_lock);
>  	reg = i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
> -	ret = (reg & LED_MASK(led->id)) >> LED_SHIFT(led->id);
> +	if (reg >= 0)
> +		ret = (reg & LED_MASK(led->id)) >> LED_SHIFT(led->id);
> +	else
> +		dev_warn(&client->dev, "failed to read LED register: %d\n", reg);
>  	mutex_unlock(&data->update_lock);
>  	return ret;
>  }
>
> ---
> base-commit: c5e32e86ca02b003f86e095d379b38148999293d
> change-id: 20260727-led-fix-28f085e12feb
>
> Best regards,
> --
> Haibo Chen <haibo.chen@nxp.com>
>
