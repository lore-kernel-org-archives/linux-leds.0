Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067A2478E57
	for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 20:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070727; cv=none; b=tbs0CevZf+unHya09M+mt59UQrhGFagT9BQmQpVtU+6HfxbI+Cj3dmY7+P72cKGSFBVs3TUu3WxBw73EJkJA5H0Xem/pwi0CfflH8P/D+hiAVRWA2FgsGqmSiYeOP0ZGMbcpOSERgrc6FaV/afLQOodkf6nAB2OXA8EqN0co2Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070727; c=relaxed/simple;
	bh=z8rJXMmxlASWUbyFEAKP8P/3qFO3Ptq8mGN9eXy1jFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMrvaAPzIXz2B7dVXBA12KiqxrnM7lGUVIBeZwc5+oJ1x28AYRjV1D8uXvkW7bKHFd4R/+M7OtBiIovUhN6/EYVGDjR13vkpummSJNRbd1DnkiAqHFyl0WYWLCUBuFvkC8piNILMoHuPSojtldGTmg4wlEkjnXI0llUDLP0bj38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuZodHjl; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuZodHjl"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d6efd73032so13749035ad.0
        for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 13:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789070723; x=1789675523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NnuVxbiXCgrcJRB1M65AA3bcvT6F9ansgD+TG7v7Nac=;
        b=RuZodHjldCffGC11wbFFs73TxA4M6SBDNALATa5B00+aFFN91sAq6hIo6zO7+HhUiZ
         Y8Kn2x7W+9175QD/NQhM/w1NtEu3/ZrID25h6YaMfmSBSSJAb2phGEUEB8hqKMc9cIfj
         sj0NVMzDe12tVa8tG7RvMPycchfpwzfbJrzqvzwNVPRTEqyfGM++NXFC4rJ8CT1RON7l
         t/9UfbQ7Gh1FevLdkaq8sUwNLLy08UsTkvWoEYW8/tMQXihSrSTOWjiUvWW9cVJnSH4X
         RIV83H/nzjK4DZ7+ypOfbW1f87vkPlv0kUr1kFbiDHgZ515Vh/ItuehpCPL8oP4tbEwP
         wB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789070723; x=1789675523;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NnuVxbiXCgrcJRB1M65AA3bcvT6F9ansgD+TG7v7Nac=;
        b=oyCFqX23QZmPxnYXFjuWM3oiF2Iq1bk3phrbxpkMUKthJhOcxoypcTKCBGuKF2hhcy
         iUpSaZ/8ecO/w2J7k72N+bfX6tjkekqeeU52DRFZLbL62RgsM9OgBsAzBlwirYaGfukE
         sbnd7gOHMoIQiJ6YBUndotgPO0jiVscrGkW+tfmby9BSLs+ig1aak5sLcl3a6bPFC4q2
         JnL+hT+zumLcXoLb/R/RuG5MJ/E+55bi7b4/GdqttJcFTi5FqRaXhvY3PtjG5Yefe4pz
         e9Pub6ePGEMXycrvDzZ4aq6bMW2vkVq6034RoNziTk8hVMKogF0F+dxFqDF8agWUFBEK
         705A==
X-Forwarded-Encrypted: i=1; AKwUvBzN8E6PySgqRCk6oa8y8pno6VBn65yDvSi82oR4OfoplxJ2xi0tv7Bvevbx2nMeEhU61a6ln6/JNAnn@vger.kernel.org
X-Gm-Message-State: AFuF++knWV78+0UN4KDkb+8AD4MOyK45wn9TqYrDvT8twZJO3KY4kA5z
	q+ERZIB2Y6b8AlIZ6Zb0R8NqeJVSbDBinLPX0n44TH46ArCTc1CBDjF6
X-Gm-Gg: AYBFou0b2wFNtedWwMp5QNT79F9ce0iiHti4FqGFHlNmwKUyXPH+whANV0+4u+Kjp/1
	OI+2gmuauOlJMRTPF11lvXLTxi2uR1v2HQAA91wsF/2VsXlnDa5bL/M2KQrVT8v+zkdNHq341wx
	AePgaEl/fPiVXdyiCWMtb0sA7fwHpsGNasGtPpfsnFJ/zWTSLRim1eata3U6R2VLJvUOz0l3suW
	Rp1fBW610LBBwNL4Zc4EwhRNgf7Wsbp7EccbBnboFrES9sIxbGzXMo5J0aY/FdfT8gHM7kOXls8
	xoYftjbZcyZ9sgSKmL9irZcscxElLirU69i1sFNCdjA6Xhd9b9NiI41V+6BarlJvPYKNKhOc4rX
	1VQ3qbSsHcHw0f9TDyGVp26KvSqxYUas8+CqRhCle8ESQp42pGM8MT3QQqKCdq/s3bIIsb/Ab/s
	h3Htw0wviw52LaVrkhrziLa6Y9WBNXAMnStqpOMlSRy8F7OvTZZckFO9jrC/6kPbAYuW/CBdGxR
	VcmT+roL9rdJr7OScKgr5plVkwKbhwLw2lqfVG2RqYhoZb8reZa45v4384qs514HA==
X-Received: by 2002:a17:902:e74d:b0:2d7:1b20:e98f with SMTP id d9443c01a7336-2dd0e8a1969mr66012825ad.2.1789070723090;
        Thu, 10 Sep 2026 13:05:23 -0700 (PDT)
Received: from [192.168.0.158] (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e95075sm409076eec.11.2026.09.10.13.05.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 13:05:22 -0700 (PDT)
Message-ID: <a781d941-90ff-452b-b2f6-c43134cc7b55@gmail.com>
Date: Thu, 10 Sep 2026 13:05:21 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] HID: hid-oxp: retain fractional brightness when
 reading RGB status
To: Andrei Aldea <andrei1998@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 linux-leds@vger.kernel.org
References: <20260910032115.28669-1-andrei1998@gmail.com>
 <20260910032115.28669-4-andrei1998@gmail.com>
Content-Language: en-US
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
In-Reply-To: <20260910032115.28669-4-andrei1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/9/26 20:21, Andrei Aldea wrote:
> Multiply the hardware brightness level by the LED brightness range before
> dividing by four. Dividing first reported every intermediate hardware
> level as zero instead of 25, 50 or 75 percent.
>
> Fixes: 84910c459d65 ("HID: hid-oxp: Add OneXPlayer configuration driver")
> Assisted-by: LLM
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Signed-off-by: Andrei Aldea <andrei1998@gmail.com>
> ---
>   drivers/hid/hid-oxp.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
> index 0c895bd..86a559c 100644
> --- a/drivers/hid/hid-oxp.c
> +++ b/drivers/hid/hid-oxp.c
> @@ -334,8 +334,8 @@ static int oxp_hid_raw_event_gen_1(struct hid_device *hdev,
>   	drvdata.rgb_en = rgb_rep->enabled == 0 ? OXP_FEAT_DISABLED :
>   						 OXP_FEAT_ENABLED;
>   	drvdata.rgb_brightness = rgb_rep->brightness;
> -	led_mc->led_cdev.brightness = rgb_rep->brightness / 4 *
> -				      led_mc->led_cdev.max_brightness;
> +	led_mc->led_cdev.brightness = rgb_rep->brightness *
> +				      led_mc->led_cdev.max_brightness / 4;
>   	/* If monocolor had less than 100% brightness on the previous boot,
>   	 * there will be no reliable way to determine the real intensity.
>   	 * Since intensity scaling is used with a hardware brightness set at max,
> @@ -423,8 +423,8 @@ static int oxp_hid_raw_event_gen_2(struct hid_device *hdev,
>   	drvdata.rgb_en = rgb_rep->enabled == 0 ? OXP_FEAT_DISABLED :
>   						 OXP_FEAT_ENABLED;
>   	drvdata.rgb_brightness = rgb_rep->brightness;
> -	led_mc->led_cdev.brightness = rgb_rep->brightness / 4 *
> -				      led_mc->led_cdev.max_brightness;
> +	led_mc->led_cdev.brightness = rgb_rep->brightness *
> +				      led_mc->led_cdev.max_brightness / 4;
>   	/* If monocolor had less than 100% brightness on the previous boot,
>   	 * there will be no reliable way to determine the real intensity.
>   	 * Since intensity scaling is used with a hardware brightness set at max,

Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
