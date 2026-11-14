Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794698049;
	b=Eavp5MoJlxYoeIYcHC8JEfD2qwpUVhAqep1TocAaMNNjPzpT14un5ro6LXy+pTn5ICPL
	 yBAw1Lsekf9LtkiQdToY0PM1JG1gERUF9QTawszHYaL43EpwsBSwxZelJIzAOSfqit41b
	 DZ0c3UWF2iiVm4N14cfMROhcdNZZtA9ZOEk4KfnprbdfB/hW7CcktCPx8wFj2MZhJ/FJQ
	 3Rl6znuW9P2ecCkLbKivUt7tU8oI73yA3FGtO3gCiLKLy0U2qA6WwOhu/EqY1OEYsaWWU
	 bpbB+3I4v7JYBLQvp5EcxgIOQQmSUwawIPd7lBKi3TpkKBebmu1AGFMz65ZOVOwKeAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794698049;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=MF8lUYm3b4Q7LDh+eTQABq+39MWDYCMYzIn/uwCA2lc=;
	b=XgzOBVt5tHfCx38rDfNypuDnj9Hs+hwHQV9a1hx69EfkK4+4gxP7zkKXCwEzbjxNEbBq
	 RXjnyRkdM0YjsrIEny2EOBFObhv6IhQZLolzxCn+aA520m/rTpkuQcqVVbfj2aXz6cof8
	 GqMx9KQeFybYulbV5dQyGHhRL/0jgCpooPGWS7GaIs68lGQX0Xp0Cz5TyL8/77ZBgF2ii
	 MTt/UAFSNIHMnxgSbF+1xwykbwrEH+aGLOix7MZNFNn19I14Rpfw4CMufc+ROreI2hvY7
	 YrjoPVzolaTzTcWtfbyWTYE9rO1ktJoPjCn/NY9DPT//g27ETOiKNHTk5l3+ndzqYuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=CbHDKu1L;
	arc=none smtp.remote-ip=95.215.58.37
Received: from mta1.migadu.com (out-37.mta1.migadu.com [95.215.58.37])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A37606A323
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 23:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2A37606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=CbHDKu1L
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=A05dQw/tOo/0VMOJJqmL5AQ8CgUPaaQgI50m9o9OW7E=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794698045; v=1; x=1795302845;
 b=CbHDKu1L/KW3VroY3wveFLiEjAAbYKLRcc9bxUaSUmYOAV9/s7F9PEy0Qf0HME4gwZjyeLUp
 6ZUlz6HQI/3g7iqTmw+OqDGVYHO5oIdPNhdIXhtynauMg6N8N11fanEx96YZv7gm4i9mWlPSaMl
 yICjm3hVwrIhGi9QKCe/ObFZ9pmoQkZrFOvlvEiKQQFkl5mmHS63hnka3RBJU9gzK24nFyIjHSd
 q5rltCpseDAzCo/O+gXjSbDMcHEsgZ1UsSV2OPdxnYHjY7boR7XoVPgHem5s5Lq0qyY8FccKWiB
 ARbMhAspQ8uIXJFcITgkKSfyQ+jWz0QrwJaX9S9CBqZXA==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f9d31ba648e08677;
	Sat, 14 Nov 2026 23:14:05 +0000
X-Mizu-Trace-ID: f9d31ba648e08677
X-Migadu-Flow: FLOW_OUT
Message-ID: <2943a816-cc56-417c-b7fd-b45d0dd11ddf@postmarketos.org>
Date: Sat, 14 Nov 2026 16:13:58 -0700
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
Subject: Re: [PATCH v7 3/4] drivers: leds: aw2013: Leverage C99 for-loops
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, lee@kernel.org
References: <20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org>
 <20261114-aw2013-aw20xx-rename-v7-3-ea5a3113a479@postmarketos.org>
 <sashiko-outbox-215079@kernel.org>
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
In-Reply-To: <sashiko-outbox-215079@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-14 4:00 p.m., sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] leds: aw2013: commit subject uses drivers: leds: prefix instead
>    of leds:
> --
> 
> commit dd420770c3e97b4e4988e32c3e735789959ed94e
> Author: Paul Sajna <sajattack@postmarketos.org>
> 
> drivers: leds: aw2013: Leverage C99 for-loops
> 
> This commit moves loop counter declarations into the for-loop headers in
> aw2013_chip_init() and aw2013_chip_in_use().
> 
>> drivers: leds: aw2013: Leverage C99 for-loops
> 
> [Severity: Low]
> This isn't a bug, but LED subsystem commit subjects use the "leds:
> <driver>: <Capitalized description>" format, so this should use the
> "leds: aw2013:" prefix instead of "drivers: leds: aw2013:".
> 

Acknowledged, must've wrote this commit msg on autopilot. I'll fix in v8 
but wait and see if there are any more pressing concerns before re-send.

---
Hal: They're going for the kernel!
Margo: Colonel Who?
