From: Jiri Pirko <jiri@resnulli.us>
Subject: Re: [patch v1 1/2] mfd: Add Mellanox regmap core driver
Date: Wed, 26 Jul 2017 13:28:20 +0200
Message-ID: <20170726112820.GB1845@nanopsycho>
References: <1501001499-21971-1-git-send-email-vadimp@mellanox.com>
 <1501001499-21971-2-git-send-email-vadimp@mellanox.com>
 <20170726111846.GB6033@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36826 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751481AbdGZL2X (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Jul 2017 07:28:23 -0400
Received: by mail-wm0-f67.google.com with SMTP id 184so19505082wmo.3
        for <linux-leds@vger.kernel.org>; Wed, 26 Jul 2017 04:28:23 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170726111846.GB6033@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Vadim Pasternak <vadimp@mellanox.com>, lee.jones@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, j.anaszewski@samsung.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org

Wed, Jul 26, 2017 at 01:18:46PM CEST, pavel@ucw.cz wrote:
>Hi!
>

[...]


>
>> +static void
>> +mlxreg_core_work_helper(struct mlxreg_core_priv_data *priv,
>> +			struct mlxreg_core_item *item, u8 is_inverse,
>> +			u16 off, u32 mask, u32 *cache)
>> +{
>> +	struct mlxreg_core_data *data;
>> +	u32 asserted, regval, bit;
>> +	int ret;
>> +
>> +	/*
>> +	 * Validate if item related to received signal type is valid.
>> +	 * It should never happen, excepted the situation when some
>> +	 * piece of hardware is broken. In such situation just produce
>> +	 * error message and return. Caller must continue to handle the
>> +	 * signals from other devices if any.
>> +	 */
>> +	if (unlikely(!item)) {
>> +		dev_err(priv->dev, "False signal is received: register at offset 0x%02x, mask 0x%02x.\n",
>> +			off, mask);
>
>Slightly too long line.

That is totally ok to have it like that for printables though. Actually,
wraping the text in half would be wrong.
