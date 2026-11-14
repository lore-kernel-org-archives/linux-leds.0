Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.42.129.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670068;
	b=eVlbWQ3VWVAsIczKIOSEa/fVuwtN1B6hPvZqjp3gPOox/Gktlzm+p9eltN1+YacYP0dc
	 +tCmJSZpJJdFILWKwtj1sLe/ydblOZpZAADUjkz/SozZvrM7lurpphzNrUG+wioOJg2Ls
	 RcGLBWhMI3Ao5QZxbfWd8ql4HhHjDewtOAu/LpjWIVe/hT3htEjkxYOBpwsQ4W8SImUn0
	 8emTXOPHuea5J8cT7t78nWrd863Glc1QS0F9EnmlHTo5PAXgGXlFPRQ0djRsJDC/HZdSx
	 sw90cxgL2tmgkmTvUkmiTvox8N17qFhhhw1qtmtjuobZeruVYYa/MgWqTZHOIp0Mqvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670068;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=cL6nP2xT/zXuruRv8Lt5ZsGWlUBwsv02XwcT5zuoyR0=;
	b=v5uF9Zpv0IB4KTgcQcRHIJrO+3ByAWDowaOlcLV8QJiFvpf2qnaVHqplPgKpF4H5rjKZ
	 cp7Lp6QdqBe3qbpl2jB45lwpSZPynlkNlpCF5Ro3gghMhfjwwP5sHKd418NX9DMUIRAt4
	 9yLyGi2GA2Rx/YdgvvegW0zEMrKc94KPjZzowfJkiQknX0KXK476WyS91jwq+V2ba5ZL4
	 c/CSxz3YzqjtMOuET0bwODmgLMlqMx0Zx0AZRkfHmZkNVDqbCLc3pxKUkXGzSPiCbXV9c
	 NAWtNh84/aDT52ZcRGAb6O5np27vCpNxpNzWcpi90Ejvmy/Iyy29pdeWmgqCDasSSUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ixit.cz;
	spf=pass smtp.mailfrom=ixit.cz;
	dkim=pass header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b="OTjNWi1/";
	arc=none smtp.remote-ip=84.42.129.46
Received: from ixit.cz (ixit.cz [84.42.129.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2610606A323;
	Sat, 14 Nov 2026 15:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2610606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=OTjNWi1/
Received: from [IPV6:2a02:830a:f787:8f00:d622:eaa3:3dd6:8f5e] (unknown [IPv6:2a02:830a:f787:8f00:d622:eaa3:3dd6:8f5e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id C2C9D5340823;
	Sat, 14 Nov 2026 16:27:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1794670060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cL6nP2xT/zXuruRv8Lt5ZsGWlUBwsv02XwcT5zuoyR0=;
	b=OTjNWi1/mR1Rw0dAqJ7tmQo3tLztFF9w72GNKxA5EZtIvJdZpIavRqRGWZMT8UL0GiEUxe
	aG99iLgTYSAQhQziayf7v9FTgWr8yt+9k+lPfOTD8rMQrMT/s/qMjU34SPFMAecOCpLvtX
	OfR1WHb6hG/G8uvJ29bv3TMdjSkG/jI=
Message-ID: <47fb5b06-3ffb-42a1-91cf-e4d098438ebe@ixit.cz>
Date: Sat, 14 Nov 2026 16:27:39 +0100
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
Subject: Re: [PATCH v6 2/3] leds: aw2013: Add AW2027 support
To: sajattack@postmarketos.org, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>,
 Alexey Min <alexeymin@minlexx.ru>, Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20261112-aw2013-aw20xx-rename-v6-0-251eca340abc@postmarketos.org>
 <20261112-aw2013-aw20xx-rename-v6-2-251eca340abc@postmarketos.org>
Content-Language: en-US, cs-CZ
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <20261112-aw2013-aw20xx-rename-v6-2-251eca340abc@postmarketos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/11/2026 01:01, Paul Sajna via B4 Relay wrote:
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
>   drivers/leds/leds-aw2013.c | 190 ++++++++++++++++++++++++++++++++++++++-------
>   1 file changed, 163 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
> index cf20e94920fd..5ff9887086a6 100644
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

just in case you'll be sending next revision, 0x7f (hex should go always lower 
case).

> +#define AW2027_LOCAL_IMAX_MASK GENMASK(3, 0)
> +
> +#define AW2027_GLOBAL_IMAX_15MA 0
> +#define AW2027_GLOBAL_IMAX_30MA 1
> +#define AW2027_GLOBAL_IMAX_5MA  2
> +#define AW2027_GLOBAL_IMAX_10MA 3
> +
>   struct aw2013;
>   

[...]

> @@ -142,9 +261,7 @@ static int aw2013_chip_enable(struct aw2013 *chip)
>   
>   static bool aw2013_chip_in_use(struct aw2013 *chip)
>   {
> -	int i;

My comment regarding to using C99 was aimed only at the new code, as you 
introducing it. If you modernizing existing code, you should do that in separate 
commit. Let maintainer decide if the split is needed here or it's ok as is :)

David

[...]
