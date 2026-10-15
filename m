Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D6E34A76F
	for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 01:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028168; cv=none; b=hzLsc327QmOcQtTjfp+/iUnrDikHAglrSIcb5FYwWHqF287GGWQF5ZH8+5G/VcdUGmN4DqgopeIqKZKv7Ny2hktJTAOGD63gs7ZB6tqjeyEpaJMMpCqzx6gD5VZSB0Inbn/KHAHkb2qydsCgxXiP/DHF9SDOjJ3zSH1mn1fO+gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028168; c=relaxed/simple;
	bh=6eZ8KqtTI7nGGFGyx9EmRFcr1jbs87z4iOgBcNhhi24=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=ALJCU6FnBXFd3Pbb9QBvSiKLJzs5g8QEkmWnfAgifVbD6MuDdgXZ/7rFEIrxcUKTDbqrH8LfR1WEeYryWcjnybDB3Zo5h6pxBIUtcElzcqHTvrAz2sp7oEBWOdDzicBUKP3E90joQ9/lklje4iw2Z984gLfkgV9EbOo81UJh1Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIKd5Ed1; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIKd5Ed1"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so6590738eec.1
        for <linux-leds@vger.kernel.org>; Wed, 14 Oct 2026 18:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028166; x=1792632966; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XJG9txNnza//TtpkrySkjqN6i4M0EXuWDnYB2FshnIs=;
        b=WIKd5Ed1K0HEUES22Cria2gvdzbe2NbGq3YV1xsmPg9FkVW9Qj2xdQXPOcprzdP60f
         SCRlioUrSENYuBDZ2Ka/Ddi2i/Ed2OQCFvhclrX32KcwGl2Jv8nOmfpB+7e1aWLtLiqN
         F+nCHS6ednyzQDA76Bu74q/LYUhISGqahN+gl6boEAmnl3+ZQ4ai9i+TpA6emTa4mXaL
         b1Xcg0zSRJru1VMXuLClC3U/IVQQrhc4swlCa1BRhyqa7fYcan3ekEBMitdiwe5sDH8j
         d3c589TRqYms7c9bjzZgUx6XkZBRvWzVDUezaIqn6M865yFs83BKk9ScifxY1sE8tlD/
         PYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028166; x=1792632966;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XJG9txNnza//TtpkrySkjqN6i4M0EXuWDnYB2FshnIs=;
        b=AEpQa0UMFSIQJMCp77ckVzS5cfqHF/kOPqrG+3etCcLA1muwMUva7AYmQV7oqcaFSf
         btKYolEmkaj98ZFaTcmsKtIzK+4PwFnGrDol1IuGiPOFB0eOs1IfvOLzxCDO7DrAIY3S
         7Aq+fvkKfFK93+wXxh/n2OnG7tZD+9sRDPnIq7OmY27psocgZdXNmsfUBblMHS1OW7nm
         SEFjmpYu38KwoX0QNfj4Oi+Ahc7lmZlKcEp/2j/pVdcKsNhWaOTps1FtdMkvNdC9iZVo
         i5l7F5urNoC0IMXP199JVWyKkkxNSL2rVlZp0jc6FBihQMoXpDeuQaeLcmqfJ/itXAWi
         UsWg==
X-Forwarded-Encrypted: i=1; AKwUvBzVXnL+nbGktVQVEmB9+3ADO1LfPvayFmWxC0hVRx0tHfLDaZMrnobFuVhiItUQuQgNzgEyS1cNq7xr@vger.kernel.org
X-Gm-Message-State: AFq9FYIPqn/nMSUpGjgkB4hXrZlZ+Tpi1Da4lylXtw+C1eWqj1QEgN+R
	MiDAygHgw3qJP8CX4MlhGNJupwNzCzVPTmkgX0KrL79g3i1p1Txi9j/y
X-Gm-Gg: AYBFou3HBCaDq5+6ANCJpu+x5dhAaMC1CjsvnRjzpjTmKHAM+Ph9eCwE/y8OXPHTJfR
	GiEnBuNf/jA1Yl++zLeB8ui/FOVJXcwZyRBHz8szeToUpWJGSI+/DwHpNpRK0yO3lukBOMov3Cu
	5+enku0zIn8jsiXYp69WoWOfQ5iKI5+3DN0kOCIyuRAlnedCAO8Sq0HmPd7qdl/Hw0JFgxqUGK4
	p08qQ6b+gwWGHTNkkNv+vK/mSO4U3lGda7XKourEV887bLTUI0jjKokvuevUHbSTFrIGUN1L3g6
	yTaniwfFalGTv7m69eH7IGp/1nPwRRskaCmWaikb4ZXz0r01Wzqt82IQz7pHb7AYZ/8IZ1a0M1k
	HzxK0AMFZM0E9pU1hPz4xh90NLlnfbDx2BQK78nUJUiK0IA6wT6/yG8Wp/CKYzS0GFqgVmOZBZF
	AxGdovNITLx5OFT8dnpbJtPPrrkeJnPnJBC/oLlcjz0RXfBlY3uYmqMgz5eUEIYs74VLpRrYXaN
	lrI+B7CTX5N2kVrBLm2lAuoVfaR7ooIj5mXfyslrYft3AWf
X-Received: by 2002:a05:7301:305:b0:35c:4800:4da with SMTP id 5a478bee46e88-35c48000c80mr10468242eec.41.1792028165484;
        Wed, 14 Oct 2026 18:36:05 -0700 (PDT)
Received: from localhost ([2a00:79e0:2ebe:8:821:261c:74c2:4177])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353810403e9sm58725607eec.2.2026.10.14.18.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:36:04 -0700 (PDT)
Date: Wed, 14 Oct 2026 18:36:04 -0700
Message-ID: <d5f54636c25e0e60731adc200a63ceb5@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Ion Agorria <ion@agorria.com>,
	=?utf-8?b?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Florian Krischer <florian.krischer@fkr.dev>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v11 2/7] mfd: Add driver for ASUS Transformer embedded controller
In-Reply-To: <20261013173504.451391-3-clamor95@gmail.com>
References: <20261013173504.451391-1-clamor95@gmail.com> <20261013173504.451391-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Svyatoslav,

On Tue, Oct 13, 2026 at 08:34:58PM +0300, Svyatoslav Ryhel wrote:
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/array_size.h>
> +#include <linux/debugfs.h>

Unused include (left over after debugfs support was dropped).

> +/**
> + * struct asus_ec_chip_info
> + *
> + * @name: prefix associated with the EC
> + * @variant: id of programming model of EC
> + * @mode: state of Factory Mode bit in EC control register
> + * @read_size: size of block to read
> + * @keyboard_mask: mask of keyboard packets
> + */
> +struct asus_ec_chip_info {
> +	const char *name;
> +	enum asusec_variant variant;
> +	enum asusec_mode fmode;
> +	u8 read_size;
> +	u8 keyboard_mask;
> +};
> +
> +/**
> + * struct asus_ec_data
> + *
> + * @ec: public part shared with all cells (must be first)
> + * @ecreq_lock: prevents simultaneous access to EC
> + * @ecreq_gpio: EC request GPIO
> + * @client: pointer to EC's i2c_client
> + * @info: pointer to EC's version description
> + * @ec_buf: buffer for EC read
> + * @logging_disabled: flag disabling logging on reset events
> + */
> +struct asus_ec_data {
> +	struct asusec_core ec;
> +	struct mutex ecreq_lock;
> +	struct gpio_desc *ecreq_gpio;
> +	struct i2c_client *client;
> +	const struct asus_ec_chip_info *info;
> +	u8 ec_buf[ASUSEC_ENTRY_BUFSIZE];
> +};

scripts/kernel-doc warns on these two structs:
- In struct asus_ec_chip_info, the kerneldoc says @mode while the field is
  named fmode.
- In struct asus_ec_data, @logging_disabled no longer exists.

> +int asus_dockram_access_ctl(struct i2c_client *client, u64 *out, u64 mask,
> +			    u64 xor)
> +{
> +	struct dockram_ec_data *ddata = i2c_get_clientdata(client);
> +	u8 *buf = ddata->ctl_buf;
...
> +static struct i2c_client *devm_asus_dockram_get(struct device *dev)
> +{
> +	struct i2c_client *parent = to_i2c_client(dev);
> +	struct i2c_client *dockram;
> +	struct dockram_ec_data *ddata;
> +	int ret;
> +
> +	dockram = i2c_new_ancillary_device(parent, "dockram",
> +					   parent->addr + ASUSEC_DOCKRAM_OFFSET);
> +	if (IS_ERR(dockram))
> +		return dockram;
> +
> +	ret = devm_add_action_or_reset(dev, asus_ec_release_dockram_dev,
> +				       dockram);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ddata = devm_kzalloc(&dockram->dev, sizeof(*ddata), GFP_KERNEL);
> +	if (!ddata)
> +		return ERR_PTR(-ENOMEM);
> +
> +	i2c_set_clientdata(dockram, ddata);
> +	mutex_init(&ddata->ctl_lock);
> +
> +	return dockram;
> +}

Attaching ddata to &dockram->dev via devm_kzalloc() and
i2c_set_clientdata() is fragile because dockram is bound to the I2C dummy
driver. If the dummy driver is unbound from dockram via sysfs, the driver
core frees &dockram->dev devres allocations and clears dockram's
driver_data to NULL, so the next call to asus_dockram_access_ctl() will
dereference NULL.

Instead of allocating a separate struct dockram_ec_data on the ancillary
i2c_client, could ctl_lock and ctl_buf live in struct asus_ec_data (or
struct asusec_core) and have asus_dockram_access_ctl() take struct
asusec_core *ec?

Thanks.

-- 
Dmitry
