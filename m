Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493663;
	b=EXWYArUPzvCNNzI3DXieq1uNpZWby4AV4KhdFzQ8Gv6ru+HwYeJj54MtCuoQry7XUOqC
	 is8gVn66hw9g7nRtj5cG6Aa5cX6q+zERo/O+V9X40z/zsLApbpwVaNkjx7B6E+XoC35y+
	 7ozAyyd6OwZDnlfdAlli4PoSiQfIhJ2cKU6iz1SEDKDByPFs0MpnlhtjRL2whH1B/820n
	 vCsfeZHKjMeU6se7CkwjYNOhBFFaMx6VIW2W0h3WrWC7/DQ2uwreIJYsZJVT3RN3Z2lIx
	 E2m973Z2kJ40UlYNALVzsIcIA+Z/lbuaqbt+uvbb1kLBP6tWLenpp7iGNX+IsMhnYAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493663;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=Jta0Pxpw0hwdi1pMSSLJ0Vt8+ko0+bO97qAIr9mi+uQ=;
	b=KCU2ohWywD+KCDpsaAfc/HC8u03+1BMF1YASWmfLK3Oz6+TdmLIhTGFQRKa9JItt1bbt
	 LbMK65wbuQOsAd7zuYMZSvNIezO4X8aENevJxpVcUXxdQqU1Vx3CARHjOPs0l/4D3ThyF
	 Rx9oC6RWMkX70BltOMW+ngrEiLOgWY2LvJ6pXRdDGxWDbaLIP2ptBvpESuiPr2PBoUyNK
	 hl6rAt4fhbBaBUAXvg9jgmxkx+LXAYa8AZZRNlpfVNNo42sE2FIa2IrX7hN9+CmTLln8H
	 PmAZLf5okRFRtAYRnT3JUVU4Pis4XXVx99k4voajbwtBBzcPhxPOXEh0iDAOJnRlj3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SeR1sJiZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79251606A319;
	Tue, 20 Oct 2026 10:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SeR1sJiZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE041F000C5;
	Tue, 20 Oct 2026 10:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792493663;
	bh=Jta0Pxpw0hwdi1pMSSLJ0Vt8+ko0+bO97qAIr9mi+uQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SeR1sJiZpNbhY55IhV1zHJkLqG+9VsTlTHYEZucK9HtkNmfBjJBq1YSn9+h1gJF8c
	 dMRLqWmV+wRWfvBQLY2ZIu3F/1DhLyt9nFSgMAKk9lmVqt+sN9/YhLVRAktUFN6o0V
	 hkhj5lTQF4YYkhnx7JhUmXtUm7wGeaunIvqhv7sqr8Rjc/CdLjLovrQsggKoBn40rI
	 5cwT4ImuDy7i2GqwvFyNqW/aA7DwwY2KTKUUgcJ2+ew/Ta6408cdGGNYopBIn0wyBi
	 Ghf93mkOexP73V5csYP/agVvv0xDvqA42BImFdoHzPmQ6F0an6n6R8Wb4+hoDLD46r
	 0JGOP+OtocN/w==
Date: Tue, 20 Oct 2026 11:54:18 +0100
From: Lee Jones <lee@kernel.org>
To: Rillian Grant <rillian.grant@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ruslan Koreev <koreev.r@gmail.com>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] leds: flash: lm3643: Describe the LED on the
 Lenovo ThinkPad X9-15 Gen 1
Message-ID: <179198409516.839288.2293417415100693160@kernel.org>
References: <20261011191026.149338-1-rillian.grant@gmail.com>
 <20261011191026.149338-5-rillian.grant@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011191026.149338-5-rillian.grant@gmail.com>
X-AI-Review-Draft: <20261011191026.149338-5-rillian.grant@gmail.com>

--- checkpatch.pl: clean (0 issues) ---

On Sun, 11 Oct 2026, Rillian Grant wrote:

> The ThinkPad X9-15 Gen 1 enumerates the LM3643 through ACPI (HID
> TXNW3643) without a _DSD, like the X1 Carbon Gen 14. It drives the
> Windows Hello IR flood illuminator with both current sources feeding a
> single LED.
>
> The flash limits were obtained from an ETW trace of the SPB class
> extension during a Windows Hello unlock. The Windows driver programs
> 304 mA per current source (code 0x19 with the LED2 override set) and a
> 400 ms flash timeout.
>
> There is no vendor value for the torch limit, so use the same
> conservative limit as the X1 Carbon Gen 14.
>
> Rename the X1 Carbon Gen 14 nodes after the machine now that the table
> has a second entry. Sources and root node remain shared.
>
> Signed-off-by: Rillian Grant <rillian.grant@gmail.com>
> ---
>  drivers/leds/flash/leds-lm3643.c | 70 +++++++++++++++++++++++++-------
>  1 file changed, 55 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/leds/flash/leds-lm3643.c b/drivers/leds/flash/leds-lm3643.c
> index 18ac75df72e2..38b1dd09a1b7 100644
> --- a/drivers/leds/flash/leds-lm3643.c
> +++ b/drivers/leds/flash/leds-lm3643.c
> @@ -692,16 +692,21 @@ static int lm3643_register_led(struct device *dev, struct lm3643 *chip,
>  	return lm3643_register_v4l2(dev, led, fwnode);
>  }
>
> -/*
> - * Lenovo ThinkPads enumerate the chip through ACPI (HID TXNW3643) without a
> - * _DSD, so the LED is not described by firmware. On the boards below it drives
> - * the Windows Hello IR flood illuminator, with both current sources feeding a
> - * single LED. Describe that with a software node, with torch and flash limits
> - * (100 mA and 300 mA per output) well below the chip's maximums.
> - */
>  static const u32 lm3643_ir_flood_sources[] = { 0, 1 };
>
> -static const struct property_entry lm3643_ir_flood_props[] = {
> +static const struct software_node lm3643_ir_flood_root = {
> +	.name = "lm3643",
> +};
> +
> +/*
> + * The Lenovo ThinkPad X1 Carbon Gen 14 enumerates the chip through ACPI
> + * (HID TXNW3643) without a _DSD, so the LED is not described by firmware.
> + * On the X1 Gen 14 it drives the Windows Hello IR flood illuminator, with
> + * both current sources feeding a single LED. Describe that with a software
> + * node, with torch and flash limits (100 mA and 300 mA per output) well below
> + * the chip's maximums.
> + */
> +static const struct property_entry lm3643_x1c14_props[] = {
>  	PROPERTY_ENTRY_U32("reg", 0),
>  	PROPERTY_ENTRY_U32_ARRAY("led-sources", lm3643_ir_flood_sources),
>  	PROPERTY_ENTRY_STRING("function", LED_FUNCTION_FLASH),
> @@ -712,19 +717,46 @@ static const struct property_entry lm3643_ir_flood_props[] = {
>  	{ }
>  };
>
> -static const struct software_node lm3643_ir_flood_root = {
> -	.name = "lm3643",
> +static const struct software_node lm3643_x1c14_led = {
> +	.name = "led-0",
> +	.parent = &lm3643_ir_flood_root,
> +	.properties = lm3643_x1c14_props,
> +};
> +
> +static const struct software_node *lm3643_x1c14_nodes[] = {
> +	&lm3643_ir_flood_root,
> +	&lm3643_x1c14_led,
> +	NULL
>  };
>
> -static const struct software_node lm3643_ir_flood_led = {
> +/*
> + * The Lenovo ThinkPad X9-15 Gen 1 enumerates the chip through ACPI
> + * (HID TXNW3643) without a _DSD. On the X9-15 it drives the Windows Hello IR
> + * flood illuminator, with both current sources feeding a single LED. Flash
> + * maximums were obtained from an SPB class extension ETW trace of the
> + * vendor-supplied Windows driver. The torch limit is a conservative value well
> + * below the chip's maximum.
> + */
> +static const struct property_entry lm3643_x9_15_props[] = {
> +	PROPERTY_ENTRY_U32("reg", 0),
> +	PROPERTY_ENTRY_U32_ARRAY("led-sources", lm3643_ir_flood_sources),
> +	PROPERTY_ENTRY_STRING("function", LED_FUNCTION_FLASH),
> +	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_IR),
> +	PROPERTY_ENTRY_U32("led-max-microamp", 200000),
> +	PROPERTY_ENTRY_U32("flash-max-microamp", 608050),
> +	PROPERTY_ENTRY_U32("flash-max-timeout-us", 400000),
> +	{ }
> +};

Given that Patch 3 [0] uses conservative fallback values (600000 uA and
300000 us) versus these traced Windows driver values (608050 uA and
400000 us), why don't we just use the same set of properties for both
machines and save ourselves some duplication?

[0]

static const struct property_entry lm3643_ir_flood_props[] = {
       PROPERTY_ENTRY_U32("reg", 0),
       PROPERTY_ENTRY_U32_ARRAY("led-sources", lm3643_ir_flood_sources),
       PROPERTY_ENTRY_STRING("function", LED_FUNCTION_FLASH),
       PROPERTY_ENTRY_U32("color", LED_COLOR_ID_IR),
       PROPERTY_ENTRY_U32("led-max-microamp", 200000),
       PROPERTY_ENTRY_U32("flash-max-microamp", 600000),
       PROPERTY_ENTRY_U32("flash-max-timeout-us", 100000),
       { }
};

> +
> +static const struct software_node lm3643_x9_15_led = {
>  	.name = "led-0",
>  	.parent = &lm3643_ir_flood_root,
> -	.properties = lm3643_ir_flood_props,
> +	.properties = lm3643_x9_15_props,
>  };
>
> -static const struct software_node *lm3643_ir_flood_nodes[] = {
> +static const struct software_node *lm3643_x9_15_nodes[] = {
>  	&lm3643_ir_flood_root,
> -	&lm3643_ir_flood_led,
> +	&lm3643_x9_15_led,
>  	NULL
>  };
>
> @@ -735,7 +767,15 @@ static const struct dmi_system_id lm3643_dmi_leds[] = {
>  			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>  			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "ThinkPad X1 Carbon Gen 14"),
>  		},
> -		.driver_data = (void *)lm3643_ir_flood_nodes,
> +		.driver_data = (void *)lm3643_x1c14_nodes,
> +	},
> +	{
> +		/* Lenovo ThinkPad X9-15 Gen 1 */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "ThinkPad X9-15 Gen 1"),
> +		},
> +		.driver_data = (void *)lm3643_x9_15_nodes,
>  	},
>  	{ }
>  };
> -- 
> 2.56.0
>
>

-- 
Lee Jones
