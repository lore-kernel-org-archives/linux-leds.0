Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.42.129.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794521410;
	b=amB/kjSBDBxF1Sn7h7DxSgoWfgLTgnlhBy4uJM05i8VlRVnhGIpEQdFZnZ3Woi65nPCo
	 OoQJkzQmy0ZIXyh2++PL4KqbOjS5SwTlsSDS44dV3qyhqTrKYMUIo068+kX5bJ6ChAoaq
	 zqQe/MA5ctM0WLwO/FVcK+cr0U2hsEwN95l6hylEstE2nTzjvqaiHEZ+SqIJ/ItS6V44i
	 7n5eSIMmULphFZWIGjRtzIiMmngok/p9QI3d6LP6Y/BoJzd1jGZ6tv7hpM92xMicIgL3n
	 HFeB2WSPCeOJn25PQ9Sz0XLZ7/O654/w2sCXV0qgGwAY0y1htyPzDu1hEVP52coXbxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794521410;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=NtMj9D3fhxaqhTR1F1ohEjBIHuCuTGtfhwFer7kgxY0=;
	b=BXZ1bZR/WUtPovmuV9oF29tkbqjKwRdSNTzVOTrEcmAm2cpcw0KlDlxqTRvCn7CXl4gc
	 IwFqYhMU1iiq0vC96/GaCYCm7l3JfifAngKu5XDDaACg9qTIO0pjycxc5/0HafWNBZGyW
	 C6zp7qNfpU39szZF+xsHuBRMfkqT+1Ag0SA/8Qu9VuE+sOj6bHc1sGPs0VSWMWFS5oTdU
	 nIXKp1d5AeUkWUsF0Gnk+Rq7zQDLGfslZiQwLMKD4ho+J7N9+OkzuQZQovUPnTCKSyUwP
	 MoiDth6fvbkz+vzi+RWCzuPJx5bgWmsKSsZdq42WD8W1yM6ioUuVI4OAPAPK5wgQ8Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ixit.cz;
	spf=pass smtp.mailfrom=ixit.cz;
	dkim=pass header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=ny1Uc9I1;
	arc=none smtp.remote-ip=84.42.129.46
Received: from ixit.cz (ixit.cz [84.42.129.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B7A606A33B;
	Thu, 12 Nov 2026 22:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8B7A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=ny1Uc9I1
Received: from [IPV6:2a02:830a:f787:8f00:d622:eaa3:3dd6:8f5e] (unknown [IPv6:2a02:830a:f787:8f00:d622:eaa3:3dd6:8f5e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 210D65340103;
	Thu, 12 Nov 2026 23:10:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1794521401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NtMj9D3fhxaqhTR1F1ohEjBIHuCuTGtfhwFer7kgxY0=;
	b=ny1Uc9I18x00my/ulG7+xgUYkrBlsWhuO13pgDgpANxL8kratHc5UtGXb/kGxdSAXvLALO
	Lug5oqJNR2I4kFMwqSH7c3HKsHbQSoUaHYq5GF/PHCP4o3Q0WWMV+St/LkzxJrpg1+D+8P
	mcFeZsqGYXTDwjjgSDfuvjz4aTs3YuQ=
Message-ID: <11724004-3e85-4f7f-a683-5ff511863bc6@ixit.cz>
Date: Thu, 12 Nov 2026 23:10:00 +0100
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] leds: aw2013: Add AW2027 support
To: sajattack@postmarketos.org, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>,
 Alexey Min <alexeymin@minlexx.ru>, Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20261112-aw2013-aw20xx-rename-v5-0-b2c5e323a90a@postmarketos.org>
 <20261112-aw2013-aw20xx-rename-v5-2-b2c5e323a90a@postmarketos.org>
Content-Language: en-US, cs-CZ
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 xsFNBF5v1x4BEADS3EddwsNsvVAI1XF8uQKbdYPY/GhjaSLziwVnbwv5BGwqB1tfXoHnccoA
 9kTgKAbiXG/CiZFhD6l4WCIskQDKzyQN3JhCUIxh16Xyw0lECI7iqoW9LmMoN1dNKcUmCO9g
 lZxQaOl+1bY/7ttd7DapLh9rmBXJ2lKiMEaIpUwb/Nw0d7Enp4Jy2TpkhPywIpUn8CoJCv3/
 61qbvI9y5utB/UhfMAUXsaAgwEJyGPAqHlC0YZjaTwOu+YQUE3AFzhCbksq95CwDz4U4gdls
 dmv9tkATfu2OmzERZQ6vJTehK0Pu4l5KmCAzYg42I9Dy4E6b17x6NncKbcByQFOXMtG0qVUk
 F1yeeOQUHwu+8t3ZDMBUhCkRL/juuoqLmyDWKMc0hKNNeZ9BNXgB8fXkRLWEUfgDXsFyEkKp
 NxUy5bDRlivf6XfExnikk5kj9l2gGlNQwqROti/46bfbmlmc/a2GM4k8ZyalHNEAdwtXYSpP
 8JJmlbQ7hNTLkc3HQLRsIocN5th/ur7pPMz1Beyp0gbE9GcOceqmdZQB80vJ01XDyCAihf6l
 AMnzwpXZsjqIqH9r7T7tM6tVEVbPSwPt4eZYXSoJijEBC/43TBbmxDX+5+3txRaSCRQrG9dY
 k3mMGM3xJLCps2KnaqMcgUnvb1KdTgEFUZQaItw7HyRd6RppewARAQABzSBEYXZpZCBIZWlk
 ZWxiZXJnIDxkYXZpZEBpeGl0LmN6PsLBlAQTAQgAPgIbAwULCQgHAgYVCgkICwIEFgIDAQIe
 AQIXgBYhBNd6Cc/u3Cu9U6cEdGACP8TTSSByBQJl+KksBQkPDaAOAAoJEGACP8TTSSBy6IAQ
 AMqFqVi9LLxCEcUWBn82ssQGiVSDniKpFE/tp7lMXflwhjD5xoftoWOmMYkiWE86t5x5Fsp7
 afALx7SEDz599F1K1bLnaga+budu55JEAYGudD2WwpLJ0kPzRhqBwGFIx8k6F+goZJzxPDsf
 loAtXQE62UvEKa4KRRcZmF0GGoRsgA7vE7OnV8LMeocdD3eb2CuXLzauHAfdvqF50IfPH/sE
 jbzROiAZU+WgrwU946aOzrN8jVU+Cy8XAccGAZxsmPBfhTY5f2VN1IqvfaRdkKKlmWVJWGw+
 ycFpAEJKFRdfcc5PSjUJcALn5C+hxzL2hBpIZJdfdfStn+DWHXNgBeRDiZj1x6vvyaC43RAb
 VXvRzOQfG4EaMVMIOvBjBA/FtIpb1gtXA42ewhvPnd5RVCqD9YYUxsVpJ9d+XsAy7uib3BsV
 W2idAEsPtoqhVhq8bCUs/G4sC2DdyGZK8MRFDJqciJSUbqA+5z1ZCuE8UOPDpZKiW6H/OuOM
 zDcjh0lOzr4p+/1TSg1PbUh7fQ+nbMuiT044sC1lLtJK0+Zyn0GwhR82oNM4fldNsaHRW42w
 QGD35+eNo5Pvb3We5XRMlBdhFnj7Siggp4J8/PJ6MJvRyC+RIJPGtbdMB2/RxWunFLn87e5w
 UgwR9jPMHAstuTR1yR23c4SIYoQ2fzkrRzuazsFNBF5v1x4BEADnlrbta2WL87BlEOotZUh0
 zXANMrNV15WxexsirLetfqbs0AGCaTRNj+uWlTUDJRXOVIwzmF76Us3I2796+Od2ocNpLheZ
 7EIkq8budtLVd1c06qJ+GMraz51zfgSIazVInNMPk9T6fz0lembji5yEcNPNNBA4sHiFmXfo
 IhepHFOBApjS0CiOPqowYxSTPe/DLcJ/LDwWpTi37doKPhBwlHev1BwVCbrLEIFjY0MLM0aT
 jiBBlyLJaTqvE48gblonu2SGaNmGtkC3VoQUQFcVYDXtlL9CVbNo7BAt5gwPcNqEqkUL60Jh
 FtvVSKyQh6gn7HHsyMtgltjZ3NKjv8S3yQd7zxvCn79tCKwoeNevsvoMq/bzlKxc9QiKaRPO
 aDj3FtW7R/3XoKJBY8Hckyug6uc2qYWRpnuXc0as6S0wfek6gauExUttBKrtSbPPHiuTeNHt
 NsT4+dyvaJtQKPBTbPHkXpTO8e1+YAg7kPj3aKFToE/dakIh8iqUHLNxywDAamRVn8Ha67WO
 AEAA3iklJ49QQk2ZyS1RJ2Ul28ePFDZ3QSr9LoJiOBZv9XkbhXS164iRB7rBZk6ZRVgCz3V6
 hhhjkipYvpJ/fpjXNsVL8jvel1mYNf0a46T4QQDQx4KQj0zXJbC2fFikAtu1AULktF4iEXEI
 rSjFoqhd4euZ+QARAQABwsF8BBgBCAAmAhsMFiEE13oJz+7cK71TpwR0YAI/xNNJIHIFAmX4
 qVAFCQ8NoDIACgkQYAI/xNNJIHKN4A/+Ine2Ii7JiuGITjJkcV6pgKlfwYdEs4eFD1pTRb/K
 5dprUz3QSLP41u9OJQ23HnESMvn31UENk9ffebNoW7WxZ/8cTQY0JY/cgTTrlNXtyAlGbR3/
 3Q/VBJptf04Er7I6TaKAmqWzdVeKTw33LljpkHp02vrbOdylb4JQG/SginLV9purGAFptYRO
 8JNa2J4FAQtQTrfOUjulOWMxy7XRkqK3QqLcPW79/CFn7q1yxamPkpoXUJq9/fVjlhk7P+da
 NYQpe4WQQnktBY29SkFnvfIAwqIVU8ix5Oz8rghuCcAdR7lEJ7hCX9bR0EE05FOXdZy5FWL9
 GHvFa/Opkq3DPmFl/0nt4HJqq1Nwrr+WR6d0414oo1n2hPEllge/6iD3ZYwptTvOFKEw/v0A
 yqOoYSiKX9F7Ko7QO+VnYeVDsDDevKic2T/4GDpcSVd9ipiKxCQvUAzKUH7RUpqDTa+rYurm
 zRKcgRumz2Tc1ouHj6qINlzEe3a5ldctIn/dvR1l2Ko7GBTG+VGp9U5NOAEkGpxHG9yg6eeY
 fFYnMme51H/HKiyUlFiE3yd5LSmv8Dhbf+vsI4x6BOOOq4Iyop/Exavj1owGxW0hpdUGcCl1
 ovlwVPO/6l/XLAmSGwdnGqok5eGZQzSst0tj9RC9O0dXO1TZocOsf0tJ8dR2egX4kxM=
In-Reply-To: <20261112-aw2013-aw20xx-rename-v5-2-b2c5e323a90a@postmarketos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2026 22:22, Paul Sajna via B4 Relay wrote:
> From: Paul Sajna <sajattack@postmarketos.org>
> 
> The AW2027 is basically the same as the AW2013.
> 
> It differs in:
> - the max current (30mA rather than 15)
> - the number of current levels for colour-mixing (16 rather than 4)
> - the supply voltage max
> - the charge indicator (unsupported by our driver at this time)
> 
> The max current register (imax) also moves from LCFG to GCR2, and the
> selectable current levels for colour-mixing (LCFG_CUR) take their place.
> 
> The current driver implementation provided here sets the global imax to
> it's maximum, and scales each led to the closest value using the local
> imax. It's the best result achievable short of adding custom sysfs
> entries and mucking up the linux interfaces.
> 
> Comparison of all AW20XX chips https://www.awinic.com/en/productCompareList?id=47&ids=1022,74,96,75,72,71,928,927,73,76,578
> AW2027 datasheet: https://doc.awinic.com/doc/202507/77b87097-27bf-48cd-af9b-9b615064c1e1.pdf
> Vendor driver: https://www.awinic.com/en/driver/AW2027DNR/454
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>   drivers/leds/leds-aw2013.c | 147 +++++++++++++++++++++++++++++++++++++++------
>   1 file changed, 129 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
> index cf20e94920fd..d3858b06e594 100644
> --- a/drivers/leds/leds-aw2013.c
> +++ b/drivers/leds/leds-aw2013.c
> @@ -1,5 +1,5 @@
>   // SPDX-License-Identifier: GPL-2.0+
> -// Driver for Awinic AW2013 3-channel LED driver
> +// Driver for Awinic AW2013/AW2027 3-channel LED drivers
>   
>   #include <linux/i2c.h>
>   #include <linux/leds.h>
> @@ -20,13 +20,15 @@
>   #define AW2013_GCR 0x01
>   #define AW2013_GCR_ENABLE BIT(0)
>   
> +#define AW20XX_GCR2 0x04
> +
>   /* LED channel enable register */
>   #define AW2013_LCTR 0x30
>   #define AW2013_LCTR_LE(x) BIT((x))
>   
>   /* LED channel control registers */
>   #define AW2013_LCFG(x) (0x31 + (x))
> -#define AW2013_LCFG_IMAX_MASK (BIT(0) | BIT(1)) // Should be 0-3
> +#define AW2013_IMAX_MASK (BIT(0) | BIT(1)) // Should be 0-3
>   #define AW2013_LCFG_MD BIT(4)
>   #define AW2013_LCFG_FI BIT(5)
>   #define AW2013_LCFG_FO BIT(6)
> @@ -51,6 +53,16 @@
>   
>   #define AW2013_TIME_STEP 130 /* ms */
>   
> +/* AW2027-specific defines */
> +#define AW2016_23_27_33_CHIPID 0x09 /* vendor shared same chipid between several chips */
> +#define AW2027_REG_MAX 0x7F /* copied from vendor driver, but only up to 0x3F is documented */
> +#define AW2027_LOCAL_IMAX_MASK GENMASK(3, 0)
> +
> +#define AW2027_GLOBAL_IMAX_15MA 0
> +#define AW2027_GLOBAL_IMAX_30MA 1
> +#define AW2027_GLOBAL_IMAX_5MA  2
> +#define AW2027_GLOBAL_IMAX_10MA 3
> +
>   struct aw2013;
>   
>   struct aw2013_led {
> @@ -60,23 +72,89 @@ struct aw2013_led {
>   	unsigned int imax;
>   };
>   
> +struct aw2013_chipdef {
> +	u8 chip_id;
> +	const struct regmap_config *regmap_cfg;
> +	u32 default_imax;
> +	bool gcr2_imax;
> +	unsigned int current_levels;
> +	unsigned int current_max_ua;
> +};
> +
>   struct aw2013 {
>   	struct mutex mutex; /* held when writing to registers */
>   	struct regulator_bulk_data regulators[2];
>   	struct i2c_client *client;
>   	struct aw2013_led leds[AW2013_MAX_LEDS];
>   	struct regmap *regmap;
> +	const struct aw2013_chipdef *cdef;
>   	int num_leds;
>   	bool enabled;
>   };
>   
> -static int aw2013_chip_init(struct aw2013 *chip)
> +static const struct regmap_config aw2013_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = AW2013_REG_MAX,
> +};
> +
> +static const struct regmap_config aw2027_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = AW2027_REG_MAX,
> +};
> +
> +static const struct aw2013_chipdef aw2013_chipdef = {
> +	.chip_id = AW2013_RSTR_CHIP_ID,
> +	.regmap_cfg = &aw2013_regmap_config,
> +	.default_imax = 1, // 5mA

instead of comment (which should be formatted such as /* */), I assume you could 
use #define here?

> +	.gcr2_imax = false,
> +	.current_levels = 4,
> +	.current_max_ua = 15000,
> +};
> +
> +static const struct aw2013_chipdef aw2027_chipdef = {
> +	.chip_id = AW2016_23_27_33_CHIPID,
> +	.regmap_cfg = &aw2027_regmap_config,
> +	.default_imax = 3, // 6mA
> +	.gcr2_imax = true,
> +	.current_levels = 16,
> +	.current_max_ua = 30000,
> +};
> +
> +/**
> + * aw2013_microamp_to_imax() - Finds the closest current step to the given microamp
> + * @microamp: Desired current in microamps
> + * @cdef: Chip definition
> + *
> + * Return: The closest current-step to the given microamp, rounded down
> + * and limited by the max current step possible for the chip.
> + */
> +static inline u32 aw2013_microamp_to_imax(u32 microamp, const struct aw2013_chipdef *cdef)
> +{
> +	u32 max_current_step = cdef->current_levels - 1;
> +	u32 closest_current_step_floor = (microamp * max_current_step) / cdef->current_max_ua;
> +
> +	return min_t(u32, closest_current_step_floor, max_current_step);
> +}
> +
> +static int aw2027_set_imax(struct aw2013 *chip)
>   {
>   	int i, ret;
>   
> -	ret = regmap_write(chip->regmap, AW2013_GCR, AW2013_GCR_ENABLE);
> +	/*
> +	 * AW2027 supports 4-step global imax, and also a 16-step control for limiting
> +	 * individual current per LED. This doesn't map to the single value the
> +	 * devicetree provides super well, so set global imax to maximum, and
> +	 * local imax to whatever gets us closest to the value in the devicetree.
> +	 */
> +	ret = regmap_update_bits(chip->regmap,
> +				 AW20XX_GCR2,
> +				 AW2013_IMAX_MASK,
> +				 AW2027_GLOBAL_IMAX_30MA);
>   	if (ret) {
> -		dev_err(&chip->client->dev, "Failed to enable the chip: %d\n",
> +		dev_err(&chip->client->dev,
> +			"Failed to set maximum global current: %d\n",

I would keep this as-is, or fixed in separate pre/post appended commit.

>   			ret);
>   		return ret;
>   	}
> @@ -84,7 +162,7 @@ static int aw2013_chip_init(struct aw2013 *chip)
>   	for (i = 0; i < chip->num_leds; i++) {
>   		ret = regmap_update_bits(chip->regmap,
>   					 AW2013_LCFG(chip->leds[i].num),
> -					 AW2013_LCFG_IMAX_MASK,
> +					 AW2027_LOCAL_IMAX_MASK,
>   					 chip->leds[i].imax);
>   		if (ret) {
>   			dev_err(&chip->client->dev,
> @@ -97,6 +175,38 @@ static int aw2013_chip_init(struct aw2013 *chip)
>   	return ret;
>   }
>   
> +static int aw2013_chip_init(struct aw2013 *chip)
> +{
> +	int i, ret;

levearage C99 :) e.g. for (int i =...

> +
> +	ret = regmap_write(chip->regmap, AW2013_GCR, AW2013_GCR_ENABLE);
> +	if (ret) {
> +		dev_err(&chip->client->dev, "Failed to enable the chip: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	if (chip->cdef->gcr2_imax) {
> +		ret = aw2027_set_imax(chip);
> +	} else {

here you can save one indentation level by returning early for gcr2_imax and 
then continue without else {}

> +		/* AW2013 only supports 4-step individual current per LED */
> +		for (i = 0; i < chip->num_leds; i++) {
> +			ret = regmap_update_bits(chip->regmap,
> +						 AW2013_LCFG(chip->leds[i].num),
> +						 AW2013_IMAX_MASK,
> +						 chip->leds[i].imax);
> +			if (ret) {
> +				dev_err(&chip->client->dev,
> +					"Failed to set maximum current for led %d: %d\n",
> +					chip->leds[i].num, ret);
> +				return ret;
> +			}
> +		}
> +	}
> +
> +	return ret;
> +}
> +
>   static void aw2013_chip_disable(struct aw2013 *chip)
>   {
>   	int ret;
> @@ -293,9 +403,9 @@ static int aw2013_probe_dt(struct aw2013 *chip)
>   		init_data.fwnode = of_fwnode_handle(child);
>   
>   		if (!of_property_read_u32(child, "led-max-microamp", &imax)) {
> -			led->imax = min_t(u32, imax / 5000, 3);
> +			led->imax = aw2013_microamp_to_imax(imax, chip->cdef);
>   		} else {
> -			led->imax = 1; // 5mA
> +			led->imax = chip->cdef->default_imax;
>   			dev_info(&chip->client->dev,
>   				 "DT property led-max-microamp is missing\n");
>   		}
> @@ -334,18 +444,18 @@ static void aw2013_chip_disable_action(void *data)
>   	aw2013_chip_disable(data);
>   }
>   
> -static const struct regmap_config aw2013_regmap_config = {
> -	.reg_bits = 8,
> -	.val_bits = 8,
> -	.max_register = AW2013_REG_MAX,
> -};
>   
>   static int aw2013_probe(struct i2c_client *client)
>   {
>   	struct aw2013 *chip;
> +	const struct aw2013_chipdef *cdef;
>   	int ret;
>   	unsigned int chipid;
>   
> +	cdef = device_get_match_data(&client->dev);
> +	if (!cdef)
> +		return -ENODEV;
> +
>   	chip = devm_kzalloc_obj(&client->dev, *chip);
>   	if (!chip)
>   		return -ENOMEM;
> @@ -357,9 +467,10 @@ static int aw2013_probe(struct i2c_client *client)
>   	mutex_lock(&chip->mutex);
>   
>   	chip->client = client;
> +	chip->cdef = cdef;
>   	i2c_set_clientdata(client, chip);
>   
> -	chip->regmap = devm_regmap_init_i2c(client, &aw2013_regmap_config);
> +	chip->regmap = devm_regmap_init_i2c(client, chip->cdef->regmap_cfg);
>   	if (IS_ERR(chip->regmap)) {
>   		ret = PTR_ERR(chip->regmap);
>   		dev_err(&client->dev, "Failed to allocate register map: %d\n",
> @@ -393,8 +504,7 @@ static int aw2013_probe(struct i2c_client *client)
>   			ret);
>   		goto error_reg;
>   	}
> -
> -	if (chipid != AW2013_RSTR_CHIP_ID) {
> +	if (chipid != chip->cdef->chip_id) {
>   		dev_err(&client->dev, "Chip reported wrong ID: %x\n",
>   			chipid);
>   		ret = -ENODEV;
> @@ -433,7 +543,8 @@ static int aw2013_probe(struct i2c_client *client)
>   }
>   
>   static const struct of_device_id aw2013_match_table[] = {
> -	{ .compatible = "awinic,aw2013", },
> +	{ .compatible = "awinic,aw2013", .data = &aw2013_chipdef },
> +	{ .compatible = "awinic,aw2027", .data = &aw2027_chipdef },
>   	{ /* sentinel */ },
>   };
>   
> @@ -450,5 +561,5 @@ static struct i2c_driver aw2013_driver = {
>   module_i2c_driver(aw2013_driver);
>   
>   MODULE_AUTHOR("Nikita Travkin <nikitos.tr@gmail.com>");
> -MODULE_DESCRIPTION("AW2013 LED driver");
> +MODULE_DESCRIPTION("AW2013/AW2027 LED driver");

I would suggest AW20xx, but up to you.

Thanks
David

>   MODULE_LICENSE("GPL v2");
> 

