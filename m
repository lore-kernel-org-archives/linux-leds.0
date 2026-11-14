Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794698782;
	b=YSYpm28cpEXIwL8d+739oMW5X7GxxIvstazmzeVo+szzdPcS/Hqu+H5Kdg489vLmD2fX
	 Bx2VTWiS0Myq/gzF0gZyZvbjJrR13fdk7XwH7TIxRRGTz7lBYsQqkOabYYwTELU8cGSh0
	 y5F9lLroLndnpibdzWtg3gbdJ7DrpB125TtA4VZXScNfBkj2+qahaU/5JB6wa/+3K62lY
	 NIVC4oiDWGy0rR0e9p/ATSmT0EpeYS2vyoVdYJQdu9zBJ5Q8HjUITmi9wLk/TLofgdUSr
	 fCOPUIMRM1CdW+y+p+HgnX/CdheCPy7joULSjMxKgTHq2ujYDgks4RcxSziD+TV/zHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794698782;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=EMfk0ho3bLvA013/LyEd2xLKKd8Fn2HHJl68lPWG/ew=;
	b=nhSUWggVCTuDIdgJ9LAKULaTUAZBHnIoLCovRq+QBkVSZZAdwzIYSQbz0VwyWyXrjer7
	 NXFV+j+Wro4Ftaotw3BxUeW6ihd6l8vTsUO6YNTnpnonEDpJllqphg3l39a0OMZgj6xAx
	 dhlT6WgS2c3fvDHCqLGjZtzrHm9WDJH6DOA/dXy2xVgrIwYkfnF8bWaPbz0sXaEeQMinq
	 jB7ylayU/uXIMAiFms2mgqfktKBojOXQoHz8uCYVu2sfQjl9Olr8FMTyO4RAT0tsj6YGf
	 SmmscotI9pF5cTvzFHG6AjXZRmjZ/eLDy+35clJFRhSC5ltSepNrjfLqT4yF9TV9nWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=PoDJ8O7G;
	arc=none smtp.remote-ip=95.215.58.104
Received: from mta1.migadu.com (out-104.mta1.migadu.com [95.215.58.104])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95753606A329
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 23:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95753606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=PoDJ8O7G
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=o3e/A2/W84C7G0G5i9x75HzWT+3Ggk3evRjjpa0aH7U=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794698774; v=1; x=1795303574;
 b=PoDJ8O7Go7fbALRUFjUMWF2nlQnDCk4LeHozgYAvVvWO5MFQLct1pPkB+xh2GVsyUFbMzjKD
 t3hG/6jKlfUNBgXaWTaM0w71vnYFKFOoqXzKBG+rUlQ+c+gSkJ2cnWfrqrQvDl4aDSkOweLaceO
 /1tahGwzVnpykuuKRzcXJJs9M2YGWMBa7e0oSGvg5GOfSx23hbcgSEDHlvawhvZRnu9Um6Pzau1
 4wlkjzFtBhX1r/x5uzDQpRcTJ+BDygLERBLg1Stpa2Z1BveDQvHjvcp200cuN0In8luK8UbgZ0T
 oMUNXnf5nrP4ksTKuNa3b9zfjdH7uNwAnWgHm5GMcjRVA==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7e92d2af4425d87d;
	Sat, 14 Nov 2026 23:26:14 +0000
X-Mizu-Trace-ID: 7e92d2af4425d87d
X-Migadu-Flow: FLOW_OUT
Message-ID: <509302ab-453c-4bb2-a75d-909c36e9e510@postmarketos.org>
Date: Sat, 14 Nov 2026 16:26:11 -0700
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
Subject: Re: [PATCH v7 4/4] leds: aw2013: Add AW2027 support
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, lee@kernel.org
References: <20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org>
 <20261114-aw2013-aw20xx-rename-v7-4-ea5a3113a479@postmarketos.org>
 <sashiko-outbox-215101@kernel.org>
Content-Language: en-US
From: Paul Sajna <sajattack@postmarketos.org>
Autocrypt: addr=sajattack@postmarketos.org; keydata=
 xjMEaVNevhYJKwYBBAHaRw8BAQdAjvGGprvrSn/CmlA1Bpjc4S5zJBNSz/6q0AESlS2JbdjN
 J1BhdWwgU2FqbmEgPHNhamF0dGFja0Bwb3N0bWFya2V0b3Mub3JnPsKZBBMWCgBBFiEEv1E8
 AP7J5F2dJQd4hycszAKyDbsFAmmt6twCGwMFCQlmAYAFCwkIBwICIgIGFQoJCAsCBBYCAwEC
 HgcCF4AACgkQhycszAKyDbv25QD9EdvXYqdH6vGQvB5HrUnMOsd37AZkKKgK87kMOXL/5tcA
 /jM3VLcq9mol+GstmBm1itIVAblXcm+H8g/wKoPXq/4LzjgEaVNevhIKKwYBBAGXVQEFAQEH
 QEgCn8S+S7t/3QvXt4dK4572qd+iTl7h4JX1FEV5XUs6AwEIB8J+BBgWCgAmFiEEv1E8AP7J
 5F2dJQd4hycszAKyDbsFAmlTXr4CGwwFCQlmAYAACgkQhycszAKyDbueJAD+IMjk8ztbONXz
 H7fieZc5LoR+6mHnddccacmQyPcGAvsA/0+5SkHEgIBuKwkzwrmKgDqcLhVuEs2f1H2GxKUX jqQI
In-Reply-To: <sashiko-outbox-215101@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-14 4:20 p.m., sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] leds: aw2013: duplicated per-LED imax update in
>    aw2013_chip_init()
> --

> [Severity: Low]
> As reported by Lee Jones on v3 [1], why duplicate the per-LED current update
> and error handling across the gcr2_imax branches in both aw2013_chip_init()
> and aw2013_probe_dt()?
> 
> Both AW2027 and AW2013 update AW2013_LCFG(led->num) with led->imax via
> regmap_update_bits() and differ only in the bitmask (AW2027_LOCAL_IMAX_MASK vs
> AW2013_IMAX_MASK, i.e. chip->cdef->current_levels - 1), so a single common
> loop in aw2013_chip_init() and a single update call in aw2013_probe_dt() can
> handle both chips.
> 
> [1] https://lore.kernel.org/r/179198402838.839288.17911568760182808689@kernel.org
> 

The reasoning is explained in the code comments, I tried to remove it, 
but it turns out it needs both. aw2013_chip_init serves to re-enable the 
chip after all leds have been shut off. aw2013_probe_dt increments 
chip->num_leds during probe, and chip_init will not be called after 
subsequent leds are discovered, because chip->enabled serves to limit 
calls of chip_init

-- 
Hal: They're going for the kernel!
Margo: Colonel Who?
