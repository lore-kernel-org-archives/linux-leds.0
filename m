Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232C2361959
	for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 20:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070870; cv=none; b=q7VcKYhbtxYGKy33JF+Oig8DjPVpeuKptqfdE9+mvcx75QAVwy8PFBqqH5UKMc+7upVDTpbYA2HsbAwqS1BuBp+wvhaHDm6M2Fb4Aqm1CV9Bt/Tpbuf4VaxuDsJq8fcl2CmBPowp/NYQnXsDBtRsO9Qs6kV8s+bp4ykHZ8KL13s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070870; c=relaxed/simple;
	bh=AsBTu9mpyhzRchZiMp555VxdVBD2V0/4+SAhW/xU12I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZP0b1WWL5WSqkE3WaI0a1SQFNH34iME13N7vYD8UNnUZJFmuIFVZ3j7ruJithBv4u5oCZHZjBXQDSTmFSfXmyS4GVJyN95IKbadRuw05SuQiqausatwLTYGR6p0M+SKzQMs3fdCd74barjBDRBuCRA8yLyV7XZcRL3vGeE+VdLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgdWidPU; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgdWidPU"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9865so656025ad.1
        for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 13:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789070861; x=1789675661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RbfqiWzAX0EbCmILdSHnkqcNgbIbLdok++0YD66gtk4=;
        b=EgdWidPURIFa8LSt5LAjKRixathjLQDpQ9s9tMS3F6HesjSKfMX+p3VKwOefesj1qO
         J4S/tvbl071upJ8yjIBXmYOrahIPSIGdsF+no94dEB1/+Q5xvuGfVhq3fQJJlhat1Zfa
         GEjvYdXCHXcGjavVnKI1hlaJhwRHp38wLH6AhPil7kfDz8O8pGX3Ja4YLPfqhY6wr4Mv
         TjlTzFEJnbqTWkBdnGHyoNh6J1HR/UGEQYqe5DEux11seSmTxDrZjZr1GdBMo/6gCXDO
         n8qMaKYI35HpHa5EabA2LfpZF43k+AlEHEUWTtclglaubnZrQnzo78T9kipkfNMKVqmB
         y8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789070861; x=1789675661;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RbfqiWzAX0EbCmILdSHnkqcNgbIbLdok++0YD66gtk4=;
        b=b5l1dyWZyrUbqCFrkOT/n8ti99sNXvYt0OzN16qwB2QiwswfdYwm+Yjyy3/dTtw89Y
         kz/1I2/18LXxesW8b4TmBHpZqSv/514YEwA7Tb/iURCy4KRiVR1bnNGlj6DGYfjqYmoN
         uD3hUY6GYtZo50B2slelK8YPbu7tHTaJROwrjxeeiE4nZqIZS8HJYRddKqt+DClEZ9Wl
         8keTQUt3QlqKnq9uUcWmnkrMlhsgjrrsrWp0z1GyOY/jdo+hypIcWMDaZejbbB1U7I8o
         2etaOGQWWVDnUZtcHnB9fsTcaXcR/Zep6AnfWodCAVdEjUrxbuRB82MS1+a77orMUKVR
         5n2g==
X-Forwarded-Encrypted: i=1; AKwUvBxR6WIQ8xHesBx8R6BylKvSUHyev64blY9s7ETEibNKWyid71ArvvV1t/J1YySe8ZSbAmvnsPJM1eEe@vger.kernel.org
X-Gm-Message-State: AFuF++l2tuU2HFYFEPb5Jown/wdY36jA01ALnLVtQgI33VeNLa+Ib881
	n2xYy1Tm22JAwUGTmZlmNtim4Y4rkClvODT7CCLl5sKj/JZkEDCoXqD8
X-Gm-Gg: AYBFou2u9DVzzR4Cp8+iTIprhVhb0mCFcMvNg3Ru7CmS4+7g7Drfd0xSM0MfuC45BOh
	WCYFNMPe1addJGaLUDzPjTlZDcKYWnOlYVSnsQD9CgMCIuIc89GQHyWezeEGOWRWqCPdGKDbARc
	qtS+9XS+CbjwpAM15ImJxAYnEqwPW5PJi+yKu6DvtWX/HblcoaBBtjTEaD8FFPrtXZFErAYmm+T
	frZE94nPok+6I9Y6y7MQkCloSrQuR4HlWqRQ5Xm9i41l/G+e1I24DJb6SU7hp4W+142KQ0huxsV
	UV6nWBnvZIo/b2ar8IomCo1z2EGzPko4WsFyZ6qBBIc5q+Drnew1yEwPvC1NrJqB61AFSHUjJH6
	ab+Y7Ox4Ag+lLj2MfRGtbC1Dht3/l5fhyVu3+bQyFLAOKELvRRuU1arY3a5MWY8V+/CGhwHmJhp
	lXVmj2GezNLeIBJDHak2JR9GpbRscuLj1VFqtEp69E9Qqt2aN1k+IM0iLIG+xsCG1BKo6UaRwpV
	KnSpwCohOuARpjfuIb9TA7HLUIIiQ5vrcVoRHyVJlSCKHu4/x9dp5IAG0qMvSRBHw==
X-Received: by 2002:a17:903:8c4:b0:2db:2ae9:fab3 with SMTP id d9443c01a7336-2dd2a33680fmr18443635ad.11.1789070861121;
        Thu, 10 Sep 2026 13:07:41 -0700 (PDT)
Received: from [192.168.0.158] (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f06423sm389262eec.20.2026.09.10.13.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 13:07:40 -0700 (PDT)
Message-ID: <d5960580-a130-4d67-8b24-1544f1e7c135@gmail.com>
Date: Thu, 10 Sep 2026 13:07:39 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] HID: hid-oxp: serialize complete RGB updates
To: Andrei Aldea <andrei1998@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 linux-leds@vger.kernel.org
References: <20260910032115.28669-1-andrei1998@gmail.com>
 <20260910032115.28669-7-andrei1998@gmail.com>
Content-Language: en-US
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
In-Reply-To: <20260910032115.28669-7-andrei1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/9/26 20:21, Andrei Aldea wrote:
> The transport mutex protects one report at a time, but changing an RGB
> effect requires a status command followed by a color or effect command.
> Serialize whole RGB transactions so sysfs and delayed brightness work do
> not interleave these command sequences.
>
> Fixes: 84910c459d65 ("HID: hid-oxp: Add OneXPlayer configuration driver")
> Assisted-by: LLM
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Signed-off-by: Andrei Aldea <andrei1998@gmail.com>
> ---
>   drivers/hid/hid-oxp.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
> index bee1317..8d07816 100644
> --- a/drivers/hid/hid-oxp.c
> +++ b/drivers/hid/hid-oxp.c
> @@ -181,6 +181,7 @@ static struct oxp_hid_cfg {
>   	struct led_classdev_mc *led_mc;
>   	struct hid_device *hdev;
>   	struct mutex cfg_mutex; /*ensure single synchronous output report*/
> +	struct mutex rgb_mutex; /*serialize complete RGB transactions*/
>   	u8 rgb_brightness;
>   	u8 gamepad_mode;
>   	u8 rumble_intensity;
> @@ -1074,6 +1075,8 @@ static ssize_t oxp_rgb_status_show(void)
>   	u16 up = get_usage_page(drvdata.hdev);
>   	u8 *data;
>   
> +	guard(mutex)(&drvdata.rgb_mutex);
> +
>   	switch (up) {
>   	case GEN1_USAGE_PAGE:
>   		data = (u8[1]) { OXP_GET_PROPERTY };
> @@ -1191,6 +1194,8 @@ static ssize_t enabled_store(struct device *dev, struct device_attribute *attr,
>   		return ret;
>   	val = ret;
>   
> +	guard(mutex)(&drvdata.rgb_mutex);
> +
>   	ret = oxp_rgb_status_store(val, drvdata.rgb_speed,
>   				   drvdata.rgb_brightness);
>   	if (ret)
> @@ -1244,6 +1249,8 @@ static ssize_t effect_store(struct device *dev, struct device_attribute *attr,
>   
>   	val = ret;
>   
> +	guard(mutex)(&drvdata.rgb_mutex);
> +
>   	ret = oxp_rgb_status_store(drvdata.rgb_en, drvdata.rgb_speed,
>   				   drvdata.rgb_brightness);
>   	if (ret)
> @@ -1302,6 +1309,8 @@ static ssize_t speed_store(struct device *dev, struct device_attribute *attr,
>   	if (val > 9)
>   		return -EINVAL;
>   
> +	guard(mutex)(&drvdata.rgb_mutex);
> +
>   	ret = oxp_rgb_status_store(drvdata.rgb_en, val, drvdata.rgb_brightness);
>   	if (ret)
>   		return ret;
> @@ -1340,6 +1349,8 @@ static void oxp_rgb_queue_fn(struct work_struct *work)
>   	u8 val = 4 * brightness / max_brightness;
>   	int ret;
>   
> +	guard(mutex)(&drvdata.rgb_mutex);
> +
>   	if (drvdata.rgb_brightness != val) {
>   		ret = oxp_rgb_status_store(drvdata.rgb_en, drvdata.rgb_speed, val);
>   		if (ret)
> @@ -1470,6 +1481,7 @@ static int oxp_cfg_probe(struct hid_device *hdev, u16 up)
>   
>   	hid_set_drvdata(hdev, &drvdata);
>   	mutex_init(&drvdata.cfg_mutex);
> +	mutex_init(&drvdata.rgb_mutex);
>   	drvdata.hdev = hdev;
>   
>   	if (up == GEN2_USAGE_PAGE && oxp_hybrid_mcu_device())

Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
