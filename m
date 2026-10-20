Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792522489;
	b=ftFa/gGwyIKmrsAhHkaoSi4amhnenDHDXUhYyc2hhr82ZyaorjIks5Mc/8uZ9q7hIvRW
	 HJ+HeaMkdpa/KyliJzU6Ey6N0Bo4roO72jgtYJ0UhSU6CWRbiy8xm2uTnmP+hht+STfCl
	 o8QdFXwVJsIxfVTC5nXuBotC9KaHJ9JBX0xKfsryzShQAOuT6i0WBIDiIXkelAb4V7d3w
	 H2Z1vqIzBPX0jE5CqY7x9TSJG2G1kyAKkOaSkSU91gmC4zmwYyZhSDIUtdYYoMwJcdbxi
	 uD/8xYa99OcQ1sqAKMdP7MwlnS1i0fRLNUeXQxejwKcwEEoDODgfev6rER5Nayy58tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792522489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=a+YGUJeEL21flQxeJgEyROLOEEmxFMPwen0F3bt91wI=;
	b=vXeTh8UEz892EPwkf/OzczGVlDRaU5zE4weMuFHkfsiIudcnnU01CnzWHdzeyK5z4Bk+
	 7nuz97Nbl0FOosJxYKGgVHegW4NWTIiuzKu9LDTE8Ju1EfHZEQuG+hOIBGQBgJg861u2K
	 ZhTYNO77EZK5I+nsIqawCvoIF08ajhuDdQqOiz6lsYI9ggzwqPDTgyXC66UtmdYG1D/D/
	 TPTCJF/o/LKYR19vA7RlKMSmD8H7/v5YVGyH+6j5KZ4ZcEZoXvhG2DOAmkuUoI9KdqpBm
	 MsoRKCsixk81uODnch0KP0izMT8RLKf5j5X04VaebZPUx+fEtNSjyMyU71OkIwMHLlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cNpSjyVD;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E54C606A319
	for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 18:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E54C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cNpSjyVD
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36681e85e87so1419644eec.1
        for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 11:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792522488; x=1793127288; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a+YGUJeEL21flQxeJgEyROLOEEmxFMPwen0F3bt91wI=;
        b=cNpSjyVDxeZMqcqxOqB9EKCdiKtPdvBLoG6NwPB2ME90BEBUSoASCok3BTJCWRzmch
         pNWcgsLpP4PYDmJr8a0L4mKvc7JsdLL2H7n7kPI2wZkDtIaq0W1rRg/MY6hUM/gy5Uoy
         W+m7CWwruUbFTIYyqnOJmBOL0w946NXdRSpxe6jaOK0BT0sCvBvGsnj6H5fBmWcWNvLZ
         msrgSrE2dYQ/4jED9CbuOpHR4ZW8ZY384J9TEKtFsWkaRluoI3p5WBWwaKkqlP4+GRbQ
         U4HwE9gc512DhP6yTqnRZIiJQwgX36aA+yBDDi2k7JIy8yC1YZIs0MXwbGp1hJ1veg6G
         SECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792522488; x=1793127288;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a+YGUJeEL21flQxeJgEyROLOEEmxFMPwen0F3bt91wI=;
        b=lZIL0otehLzp45twcXCRV7Sfm45Ima9s9MxG7GQzcZjeBausyj62C+qvQRuby3nsvH
         VztEtO6Zs1SgHGxpZt+DoRZsnPoR2zv/PBQnUaxyfC5BCo02yV9dYUhKmLgSBV/XnBX4
         4eUHmsbhgLcuhEQFDvaEeZqKtGn5sLhNsW0Py8Uit27XljQ0p20pvy80qce6AaUMV8Ux
         /lIsCEiOn4nRcjKwJTX/WM9Mvu/KeOB9I0UVXm/QzlL29cwZ4HlkRzMgFAu7TQ+h5jBV
         DziNYArdQIjlabG73O3YHwn56SeOldB6rbDJfgoqppm/Q7FNx+GZGW/kyKlVBGYqpA9h
         S+ug==
X-Forwarded-Encrypted: i=1; AKwUvBzkhxh5jkw3RGyB6bQjBTvZi4nZiJKioM9v34BnC0jNrl9n9K9EZ4BfEny51FY55KXV/fZ+g7ohDeoU@vger.kernel.org
X-Gm-Message-State: AFq9FYLBCbA9k6M2uz62581WRXvkQg8j8AmTK2UxIsWz8VbPlCRn3D/4
	TV84hJy6kdP+N6rnVO2eJQ+NyjPKc6mI4GvY2LpV9tak2fAYFLmhnOXG
X-Gm-Gg: AYBFou0vMRgPsWDGPQhBnsu4ioNWw1N3+WvrGTRjlWofZSGNOjS5C/01YQCI4yKVbPU
	T9/XkF0ngWlZJ8ZSkU1KXvjpNJ6A4OBz20e9Bo3dq8SeW+bw3aGS3rENa2sv1AGcuLYQ/pb3OQs
	+dWSCYl1nTVMn7JnPVvUG38dZWkHjon0wOpGvBMEA9MyEi0+z6Pv7eCTFxc59NGjx2IfQ511PCO
	mHAFFz5YL5sEBL6KCgJ9flt24K8XBFW4v/jZJkvRLXW3HCI/y0FRxAII9fG9VQUv5t1qBP7kFmm
	qr/wOauYpsVOCM6Q3Zs0vnpaIW2tGuCIpWoeUVQiWbBCfF4bl5pt07j5L2L+gHALnBkCIyYXvYE
	gXyrLUHGltXemLaEZqHP580FGK1GaDzFcnkYYTWteqSYxqNwFwZdgv6g7YDqFAMkiH//X3bMDI4
	W/9nCdI5F03g7R8X5oHe2ZmNpysUhUPdnusdQbBSISyAh8nGd9tGSv3Jgv9lUfsvg2ALIhSO1g7
	RIwNxXEZGA4zxITYc5+kRIYQEbMzcPfIS5ufvw4
X-Received: by 2002:a05:693c:6382:10b0:35c:de00:93d3 with SMTP id 5a478bee46e88-3674f6143a2mr134088eec.40.1792522488031;
        Tue, 20 Oct 2026 11:54:48 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405ed2absm606896eec.5.2026.10.20.11.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:54:47 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:54:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Ion Agorria <ion@agorria.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, mfd@lists.linux.dev, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v12 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
Message-ID: <ate3WJz8gg9LUG9u@google.com>
References: <20261019100406.103687-1-clamor95@gmail.com>
 <20261019100406.103687-5-clamor95@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019100406.103687-5-clamor95@gmail.com>

On Mon, Oct 19, 2026 at 01:04:03PM +0300, Svyatoslav Ryhel wrote:
> From: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> 
> Add support for multimedia top button row of ASUS Transformer's Mobile
> Dock keyboard. Driver is made that function keys (F1-F12) are used by
> default which suits average Linux use better and with pressing
> ScreenLock + AltGr function keys layout is switched to multimedia keys.
> Only Dock keyboard input events are tracked for AltGr pressing.
> 
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> +
> +static void asus_ec_keys_setup_keymap(struct asus_ec_keys_data *priv)
> +{
> +	struct input_dev *dev = priv->xidev;
> +	unsigned int i;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(priv->keymap) < ARRAY_SIZE(asus_ec_dock_ext_keys));
> +
> +	dev->keycode = priv->keymap;
> +	dev->keycodesize = sizeof(*priv->keymap);
> +	dev->keycodemax = ARRAY_SIZE(priv->keymap);
> +
> +	input_set_capability(dev, EV_MSC, MSC_SCAN);
> +	input_set_capability(dev, EV_KEY, KEY_UNKNOWN);
> +
> +	for (i = 0; i < ARRAY_SIZE(asus_ec_dock_ext_keys); i++) {
> +		unsigned int code = asus_ec_dock_ext_keys[i];
> +
> +		if (!code)
> +			continue;

Nit: this check is not needed, input core will remove KEY_RESERVED (0)
from the keybit when device is registered.

> +
> +		__set_bit(code, dev->keybit);
> +		priv->keymap[i] = code;
> +	}
> +}
> +
> +static int asus_ec_keys_probe(struct platform_device *pdev)
> +{
> +	struct i2c_client *parent = to_i2c_client(pdev->dev.parent);
> +	struct asusec_core *ec = dev_get_drvdata(pdev->dev.parent);
> +	struct device *dev = &pdev->dev;
> +	struct asus_ec_keys_data *priv;
> +	int error;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +	priv->ec = ec;
> +
> +	priv->xidev = devm_input_allocate_device(dev);
> +	if (!priv->xidev)
> +		return -ENOMEM;
> +
> +	priv->xidev->name = devm_kasprintf(dev, GFP_KERNEL, "%s Keyboard Ext",
> +					   ec->model);
> +	priv->xidev->phys = devm_kasprintf(dev, GFP_KERNEL, "i2c-%u-%04x",
> +					   i2c_adapter_id(parent->adapter),
> +					   parent->addr);
> +
> +	if (!priv->xidev->name || !priv->xidev->phys)
> +		return -ENOMEM;
> +
> +	asus_ec_keys_setup_keymap(priv);
> +
> +	error = input_register_device(priv->xidev);
> +	if (error)
> +		return dev_err_probe(dev, error,
> +				     "failed to register extension keys\n");
> +
> +	priv->nb.notifier_call = asus_ec_keys_notify;
> +
> +	error = blocking_notifier_chain_register(&ec->notify_list, &priv->nb);
> +	if (error)
> +		return error;
> +
> +	ec->ext_keys_enabled = true;

I think this block (after input_register_device()) can go into open()
method for the input device.

> +
> +	return 0;
> +}
> +
> +static void asus_ec_keys_remove(struct platform_device *pdev)
> +{
> +	struct asus_ec_keys_data *priv = platform_get_drvdata(pdev);
> +	struct asusec_core *ec = priv->ec;
> +
> +	ec->ext_keys_enabled = false;
> +	blocking_notifier_chain_unregister(&ec->notify_list, &priv->nb);

And this into close().

Thanks.

-- 
Dmitry
