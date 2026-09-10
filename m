Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCCE496D5C
	for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 20:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789071155; cv=none; b=e+LHC149XKoDrtvs/86LfdSB+c21S2ywCEegKvWoxQ3CvfoBz/eeCuF+FFp1jpFGYxZGyQCKYq9WaaIqXsVzk7NebRZrbvJ3ss44pzrVqMq2VsJSKgvH1wGNmyR4MWHXnaP2DEgq/ONpYaPbHEi8zGFG7HMUaTwuGvATDSvQzXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789071155; c=relaxed/simple;
	bh=IL/B5xbFl3JxOIccUMzALG8qHyO9zcro8rwwEjt15ss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aMtdi+vnZ31AiCYWnaf3dqmpIzk5Un4qWAGNi+XyCQtzvO6b0xxV/7UihuwT9/ROSDbZn54jykdHhZdbpKNE4mM5dyuK4qn8WsWqg6hcGqvT7IEP8JGPc9xIe0bu4SQwGv8N+2J0C2Y/wwNGzWtOAQxXNY/nwhcZg6gZlP+o+Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p8kgZ2Lv; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p8kgZ2Lv"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-39647184c73so1205761a91.1
        for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 13:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789071152; x=1789675952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2iriQrm9CmEkrRMgEG9C5hP2mZVWBMvEJhx/hNoLnw=;
        b=p8kgZ2Lv/WYZ2VtMj+9r+xDa0ZqLMOBAFknAgqDuXQWzdY2et5BFRMzFJS32Yx9zdf
         RGpGqlH/Ez0bls/KF2otqgGK8INwkQO6ktKZzWoCea5Kn1vXM/ap7vYufBjrILTrtxbT
         wpUFk6SvY2nRry6Er6+5FOro1rpL8m3fjmznV27baNS+L+jrW6d053PSTe5NIt4ibSUS
         RUwdCHqoNR5ehg8kVMgN9ov5XbtnNhhIaoq8HVitEaO+9PABRaUWOLkJCoVQZ8/jxcu/
         2nDdaMDd76cEtfmxUAKVyiSKspbPYCvFICMfhP/lxr5dJOp1rs/AQBWg13SLOaF/N2Oa
         pphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789071152; x=1789675952;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2iriQrm9CmEkrRMgEG9C5hP2mZVWBMvEJhx/hNoLnw=;
        b=jCayGTwrYlrusDUEXVlafjNQApaGoXcp8JDi3gVtHeG5wokNqMIQyZt+NilGxRqOeB
         j2nbEEzrUxWPBW4wF+R0yVFflovRMgmbUPSVcRYbB4qycf3muuO4Mt05GqYCaaeuf9fw
         Z1VN4IxrmlJtRzULnDm0EoxulCDUddO+6w3JekH53RTJO55AqB99/y8LTQJk2EsDfOPO
         f+RmpRnBEWiyEDJel9/15v/xkfVBrk214sH2iVjy02UvfrQbLbVsNw02CIYIYchDbHMK
         zKqsk8FBoc0jDweNqRn0HQf8cZcvvpLytP6WFO4iIlCfBHeleIJthmcojSevQMjfgcQg
         U/8w==
X-Forwarded-Encrypted: i=1; AKwUvBxngnqem7qoqzo3D6YqrWdWP0aJBZHBswo+5uvYv2aj8Oo3ejx87aIPL+kJOMlsFbxHie8TQF40eGKe@vger.kernel.org
X-Gm-Message-State: AFuF++ntnBqMuoRQv6SFZm61aSyQ5DeHyU0L9zarFa8bWra9YZl/FiB4
	GBeagw+Tp5+H8pTWsuwQF+/KSeMH49Mq8n3me12Xv0rluM6z7W+NwUoF
X-Gm-Gg: AYBFou2gXg95WSYUrkH0oyEKFGmNx69FtVG/fZzPuVX6j8zZkp967umegmJg051ST3T
	FgeRtHKggBXvW7EMTfC9fF2lIWLCos4Zo7/cKI/+yf+tNI0ZDoNliK1B4as52+hghXEf7O4MDac
	z5JQhFIR84SUAoQQ5JklK3di0kO2YZCbf4ZJXsbTFAl7pZpig2r2Xl2fop8C6drf81qEY3gEnk4
	XX1rkHGnM63k5XwDV+cPAQXILCoVoRTwWDnjfW2IFt9OTM6PfQqN6poUkUkmWrpg0bgVPG3iBU/
	UN8ZfvvIBNsSwLb7cbc4reZ9nX7VwGKtideqKQDWzuqHrN3qEx7QYrrs6H9o59zy+fBgOUNGXnO
	zWaIPe09QTYbtV+w6dYhviK920qU/IYatLIhINlPKpvGMk3hJ0P2mAyABh6y5cXPgLLOWncXzy8
	5iZlMXX+kcoezW4H6hkzLYmt5gclJSTlUo6tR3FyNIOb2OPSAsf9jKkMM17y2vdRVxdnoLvf5m6
	pha7io95R4oyHQRPHQikw/Q9jg9TdzW7TDtKcvrB04EEF8OoJ35py2oyz3P9rCTXg==
X-Received: by 2002:a17:90b:3c8b:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39d77b7b11bmr8092164a91.24.1789071152117;
        Thu, 10 Sep 2026 13:12:32 -0700 (PDT)
Received: from [192.168.0.158] (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f739b5sm459542eec.25.2026.09.10.13.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 13:12:31 -0700 (PDT)
Message-ID: <023908a2-64ac-424d-b7c2-2c42e8cf18c7@gmail.com>
Date: Thu, 10 Sep 2026 13:12:30 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/15] HID: hid-oxp: stop configuration work during
 teardown
To: Andrei Aldea <andrei1998@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 linux-leds@vger.kernel.org
References: <20260910032115.28669-1-andrei1998@gmail.com>
 <20260910032115.28669-9-andrei1998@gmail.com>
Content-Language: en-US
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
In-Reply-To: <20260910032115.28669-9-andrei1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/9/26 20:21, Andrei Aldea wrote:
> Configuration callbacks can queue delayed RGB, button-mapping, and MCU
> initialization work. Normal removal previously closed the HID transport
> without synchronously stopping that work, while a later configuration
> probe failure could leave work queued as devres released its objects.
>
> Track which work items have been initialized, reject new output once
> teardown begins, disable initialized work synchronously, and drain an
> in-flight transport write before closing the device. Use the same
> shutdown path for normal removal and every probe-error unwind after work
> can have been exposed.
>
> This also avoids operating on uninitialized work for HID interfaces that
> do not own configuration state.
>
> Fixes: 84910c459d65 ("HID: hid-oxp: Add OneXPlayer configuration driver")
> Assisted-by: LLM
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Signed-off-by: Andrei Aldea <andrei1998@gmail.com>
> ---
>   drivers/hid/hid-oxp.c | 94 +++++++++++++++++++++++++++++++++++--------
>   1 file changed, 77 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
> index 9c22c8e..eef57c3 100644
> --- a/drivers/hid/hid-oxp.c
> +++ b/drivers/hid/hid-oxp.c
> @@ -188,6 +188,9 @@ static struct oxp_hid_cfg {
>   	u8 rgb_effect;
>   	u8 rgb_speed;
>   	u8 rgb_en;
> +	bool rgb_work_initialized;
> +	bool gen2_work_initialized;
> +	bool removing;
>   } drvdata;
>   
>   #define OXP_FILL_PAGE_SLOT(page, btn)            \
> @@ -320,7 +323,7 @@ static int oxp_hid_raw_event_gen_1(struct hid_device *hdev,
>   	struct led_classdev_mc *led_mc = drvdata.led_mc;
>   	struct oxp_gen_1_rgb_report *rgb_rep;
>   
> -	if (size < sizeof(*rgb_rep))
> +	if (size < sizeof(*rgb_rep) || !led_mc)
>   		return 0;
>   
>   	if (data[1] != OXP_FID_GEN1_RGB_REPLY)
> @@ -360,6 +363,9 @@ static void oxp_mcu_init_fn(struct work_struct *work)
>   	u8 gp_mode_data[3] = { OXP_GP_MODE_DEBUG, 0x01, 0x02 };
>   	int ret;
>   
> +	if (READ_ONCE(drvdata.removing))
> +		return;
> +
>   	/* Re-apply the button mapping */
>   	ret = oxp_set_buttons();
>   	if (ret)
> @@ -406,13 +412,16 @@ static int oxp_hid_raw_event_gen_2(struct hid_device *hdev,
>   	 * Re-apply our settings after this has been received.
>   	 */
>   	if (data[3] == OXP_EFFECT_MONO_TRUE) {
> -		mod_delayed_work(system_dfl_wq, &drvdata.oxp_mcu_init, msecs_to_jiffies(50));
> +		if (READ_ONCE(drvdata.gen2_work_initialized) &&
> +		    !READ_ONCE(drvdata.removing))
> +			mod_delayed_work(system_dfl_wq, &drvdata.oxp_mcu_init,
> +					 msecs_to_jiffies(50));
>   		return 0;
>   	}
>   
>   	if (data[3] != OXP_GET_PROPERTY)
>   		return 0;
> -	if (size < sizeof(*rgb_rep))
> +	if (size < sizeof(*rgb_rep) || !led_mc)
>   		return 0;
>   
>   	rgb_rep = (struct oxp_gen_2_rgb_report *)data;
> @@ -449,6 +458,9 @@ static int oxp_hid_raw_event(struct hid_device *hdev, struct hid_report *report,
>   {
>   	u16 up = get_usage_page(hdev);
>   
> +	if (!hid_get_drvdata(hdev) || READ_ONCE(drvdata.removing))
> +		return 0;
> +
>   	dev_dbg(&hdev->dev, "raw event data: [%*ph]\n", size, data);
>   
>   	switch (up) {
> @@ -476,6 +488,9 @@ static int mcu_property_out(u8 *header, size_t header_size, u8 *data,
>   		return -EINVAL;
>   
>   	guard(mutex)(&drvdata.cfg_mutex);
> +	if (READ_ONCE(drvdata.removing))
> +		return -ENODEV;
> +
>   	memcpy(dmabuf, header, header_size);
>   	memcpy(dmabuf + header_size, data, data_size);
>   	if (footer_size)
> @@ -717,6 +732,9 @@ static void oxp_btn_queue_fn(struct work_struct *work)
>   {
>   	int ret;
>   
> +	if (READ_ONCE(drvdata.removing))
> +		return;
> +
>   	ret = oxp_set_buttons();
>   	if (ret)
>   		dev_err(&drvdata.hdev->dev,
> @@ -802,7 +820,9 @@ static ssize_t map_button_store(struct device *dev,
>   	default:
>   		return -EINVAL;
>   	}
> -	mod_delayed_work(system_dfl_wq, &drvdata.oxp_btn_queue, msecs_to_jiffies(50));
> +	if (!READ_ONCE(drvdata.removing))
> +		mod_delayed_work(system_dfl_wq, &drvdata.oxp_btn_queue,
> +				 msecs_to_jiffies(50));
>   	return count;
>   }
>   
> @@ -1356,6 +1376,9 @@ static void oxp_rgb_queue_fn(struct work_struct *work)
>   	u8 val = 4 * brightness / max_brightness;
>   	int ret;
>   
> +	if (READ_ONCE(drvdata.removing))
> +		return;
> +
>   	guard(mutex)(&drvdata.rgb_mutex);
>   
>   	if (drvdata.rgb_brightness != val) {
> @@ -1379,6 +1402,9 @@ static void oxp_rgb_queue_fn(struct work_struct *work)
>   static void oxp_rgb_brightness_set(struct led_classdev *led_cdev,
>   				   enum led_brightness brightness)
>   {
> +	if (READ_ONCE(drvdata.removing))
> +		return;
> +
>   	led_cdev->brightness = brightness;
>   	mod_delayed_work(system_dfl_wq, &drvdata.oxp_rgb_queue, msecs_to_jiffies(50));
>   }
> @@ -1480,6 +1506,24 @@ static bool oxp_hybrid_mcu_device(void)
>   	return quirks->hybrid_mcu;
>   }
>   
> +static void oxp_drain_output(void)
> +{
> +	/* Wait for any in-flight sysfs output before closing the transport. */
> +	guard(mutex)(&drvdata.cfg_mutex);
> +}
> +
> +static void oxp_quiesce_work(void)
> +{
> +	WRITE_ONCE(drvdata.removing, true);
> +	if (drvdata.rgb_work_initialized)
> +		disable_delayed_work_sync(&drvdata.oxp_rgb_queue);
> +	if (drvdata.gen2_work_initialized) {
> +		disable_delayed_work_sync(&drvdata.oxp_btn_queue);
> +		disable_delayed_work_sync(&drvdata.oxp_mcu_init);
> +	}
> +	oxp_drain_output();
> +}
> +
>   static int oxp_cfg_probe(struct hid_device *hdev, u16 up)
>   {
>   	struct oxp_bmap_page_1 *bmap_1;
> @@ -1490,6 +1534,7 @@ static int oxp_cfg_probe(struct hid_device *hdev, u16 up)
>   	mutex_init(&drvdata.cfg_mutex);
>   	mutex_init(&drvdata.rgb_mutex);
>   	drvdata.hdev = hdev;
> +	drvdata.removing = false;
>   
>   	if (up == GEN2_USAGE_PAGE && oxp_hybrid_mcu_device())
>   		goto skip_rgb;
> @@ -1497,16 +1542,21 @@ static int oxp_cfg_probe(struct hid_device *hdev, u16 up)
>   	drvdata.led_mc = &oxp_cdev_rgb;
>   
>   	INIT_DELAYED_WORK(&drvdata.oxp_rgb_queue, oxp_rgb_queue_fn);
> +	drvdata.rgb_work_initialized = true;
>   	ret = devm_led_classdev_multicolor_register(&hdev->dev, &oxp_cdev_rgb);
> -	if (ret)
> -		return dev_err_probe(&hdev->dev, ret,
> +	if (ret) {
> +		dev_err_probe(&hdev->dev, ret,
>   				     "Failed to create RGB device\n");
> +		goto err_quiesce;
> +	}
>   
>   	ret = devm_device_add_group(drvdata.led_mc->led_cdev.dev,
>   				    &oxp_rgb_attr_group);
> -	if (ret)
> -		return dev_err_probe(drvdata.led_mc->led_cdev.dev, ret,
> +	if (ret) {
> +		dev_err_probe(drvdata.led_mc->led_cdev.dev, ret,
>   				     "Failed to create RGB configuration attributes\n");
> +		goto err_quiesce;
> +	}
>   
>   	ret = oxp_rgb_status_show();
>   	if (ret)
> @@ -1519,14 +1569,18 @@ static int oxp_cfg_probe(struct hid_device *hdev, u16 up)
>   
>   skip_rgb:
>   	bmap_1 = devm_kzalloc(&hdev->dev, sizeof(struct oxp_bmap_page_1), GFP_KERNEL);
> -	if (!bmap_1)
> -		return dev_err_probe(&hdev->dev, -ENOMEM,
> +	if (!bmap_1) {
> +		ret = dev_err_probe(&hdev->dev, -ENOMEM,
>   				     "Unable to allocate button map page 1\n");
> +		goto err_quiesce;
> +	}
>   
>   	bmap_2 = devm_kzalloc(&hdev->dev, sizeof(struct oxp_bmap_page_2), GFP_KERNEL);
> -	if (!bmap_2)
> -		return dev_err_probe(&hdev->dev, -ENOMEM,
> +	if (!bmap_2) {
> +		ret = dev_err_probe(&hdev->dev, -ENOMEM,
>   				     "Unable to allocate button map page 2\n");
> +		goto err_quiesce;
> +	}
>   
>   	drvdata.bmap_1 = bmap_1;
>   	drvdata.bmap_2 = bmap_2;
> @@ -1537,14 +1591,21 @@ skip_rgb:
>   	drvdata.rumble_intensity = 5;
>   
>   	INIT_DELAYED_WORK(&drvdata.oxp_mcu_init, oxp_mcu_init_fn);
> +	WRITE_ONCE(drvdata.gen2_work_initialized, true);
>   	mod_delayed_work(system_dfl_wq, &drvdata.oxp_mcu_init, msecs_to_jiffies(50));
>   
>   	ret = devm_device_add_group(&hdev->dev, &oxp_cfg_attrs_group);
> -	if (ret)
> -		return dev_err_probe(&hdev->dev, ret,
> +	if (ret) {
> +		dev_err_probe(&hdev->dev, ret,
>   				     "Failed to attach configuration attributes\n");
> +		goto err_quiesce;
> +	}
>   
>   	return 0;
> +
> +err_quiesce:
> +	oxp_quiesce_work();
> +	return ret;
>   }
>   
>   static int oxp_hid_probe(struct hid_device *hdev,
> @@ -1587,9 +1648,8 @@ static int oxp_hid_probe(struct hid_device *hdev,
>   
>   static void oxp_hid_remove(struct hid_device *hdev)
>   {
> -	cancel_delayed_work(&drvdata.oxp_rgb_queue);
> -	cancel_delayed_work(&drvdata.oxp_btn_queue);
> -	cancel_delayed_work(&drvdata.oxp_mcu_init);
> +	if (hid_get_drvdata(hdev))
> +		oxp_quiesce_work();
>   	hid_hw_close(hdev);
>   	hid_hw_stop(hdev);
>   }


Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>

