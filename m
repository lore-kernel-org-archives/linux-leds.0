Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1294E9C38;
	Tue, 29 Sep 2026 09:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673278; cv=none; b=U7CEDj4UjUJn3TrDKfU5s5H8v5Wycecg48rq5yx90TU6+eHqWuwAw5yBwN6tSE61brux4AKBc8caLKzY5IrD+jk1NAEAUgBSaAAYpo2ZvuKbAHYOhkgnQa7pPzsyHTV3jtCW8Ku6a1erlc6pN1Y0SZzXMTui7Et6fl3yV8tReyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673278; c=relaxed/simple;
	bh=CL1Zv8knziDZC6oRxoE9V48+uXwoXSyOri+Zo7AaTCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORLcm5GJfUMTsaLejUfVwM6E2N0xdPPHwjoBq85GG7avb/PEgi9H2C2bdDjGYnxhMfec1zD4hWzie1+pp6Ou6TtfTAMG8gMDppsOgZcmTW/zvsbTSFfzges30Axg0/99z3YL+rxpU6WSqLfGIDrdrQfERd9dD+bpwE4FyO/Na7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYx3d08A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYx3d08A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48681F000FF;
	Tue, 29 Sep 2026 09:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790673273;
	bh=n6T1ynRcKr1a67zf8mbvMcuTmUzLD/Tx1pDqIK+0sLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oYx3d08AW5OmHbw0x65wZXPyVWRxhcF6UpJ1oIhyvZc3gFmR8U9iFmyzw8zdtL7rY
	 A03Jg6hlr8H7a9VdQBdFCfkR6z2Mfgi0zlv9viz+NgxgQP5ilDJTCDhMaj7qHvrJZj
	 pWiBzW02JMfijuGTJc2WsOCXA08I6eCkkmIOtV35gdBR/qjvJXpCJA4rRdjClRF2sd
	 UjA3ldRPjoGOZaz7dgRe3r6VkISb1CRJWzFK0XIPa3qcsqYh8kvxaHJG48BjVRDFMl
	 rQZjQsdVFArVPZ1mqmZX/LmIKVJG5j1rwpgxJlCYgBiF/4bQtLS3bqWDXjrEdxq1XD
	 3B9qhYMurdSiQ==
Date: Tue, 29 Sep 2026 10:14:28 +0100
From: Lee Jones <lee@kernel.org>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
	Marek Vasut <marex@denx.de>,
	Pieterjan Camerlynck <pieterjanca@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux@ew.tq-group.com, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/10] leds: pca995x: Add support for reset GPIO
Message-ID: <20260929091428.GE2112133@google.com>
References: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
 <ffbbfaf03a2b7b859a4ee01e18a161026ca319cd.1790087890.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffbbfaf03a2b7b859a4ee01e18a161026ca319cd.1790087890.git.nora.schiffer@ew.tq-group.com>

On Tue, 22 Sep 2026, Nora Schiffer wrote:

> The PCA9952/9955B/9956B have a reset pin. Use it to reset the LED driver
> if provided in the Device Tree.
> 
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---
>  drivers/leds/leds-pca995x.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
> index e6122b33451ed..b528b2b4990a7 100644
> --- a/drivers/leds/leds-pca995x.c
> +++ b/drivers/leds/leds-pca995x.c
> @@ -8,6 +8,8 @@
>   * Copyright 2023 Marek Vasut
>   */
>  
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/leds.h>
>  #include <linux/module.h>
> @@ -121,6 +123,7 @@ static int pca995x_probe(struct i2c_client *client)
>  	struct fwnode_handle *led_fwnodes[PCA995X_MAX_OUTPUTS] = { 0 };
>  	struct device *dev = &client->dev;
>  	const struct pca995x_chipdef *chipdef;
> +	struct gpio_desc *reset_gpio;
>  	struct pca995x_chip *chip;
>  	struct pca995x_led *led;
>  	int i, reg, ret;
> @@ -130,6 +133,16 @@ static int pca995x_probe(struct i2c_client *client)
>  	if (!dev_fwnode(dev))
>  		return -ENODEV;
>  
> +	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(reset_gpio),
> +				     "failed to request reset GPIO\n");
> +	if (reset_gpio) {
> +		udelay(3);

It's strange to see delays _before_ actions.

What are you delaying for exactly?

> +		gpiod_set_value_cansleep(reset_gpio, 0);
> +		usleep_range(1500, 1600);
> +	}
> +
>  	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
>  	if (!chip)
>  		return -ENOMEM;
> -- 
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> https://www.tq-group.com/
> 

-- 
Lee Jones
