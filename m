Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.235.175.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973910;
	b=OkondRiHXQlvB2H7QoH0lZF0n9OEtgTeVPmLXCdCyZlBI43K8cQJl6k/lpGX/+kTUbc9
	 DdX3le9w6p2mSUHwzHMAWk7K7U5Txn81jrcdoXmfTFrKZ7kSKiqoyf8563Oc1i/n8KJY7
	 gWGNb98vrpNdKBAoR6x8fTylNkVvcMil9rTzlaWTUmYNJt5Tgu8xuQesgdxlWGpQVlk0u
	 zcT5lOaUgIuW9hHIlYSzFkSZU5rGgpG9M5M8xD5j54u2RyJor/+pBoB2ERrMbiNE0RNb/
	 fY/15ifL25CklcN54bNxN1Mj1p6Z5zMevx1JfOiD4+8oBMVHsleJWfV1tyAdzxu6++A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973910;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-Get-Message-Sender-Via:X-Authenticated-Sender:X-Source:
	 X-Source-Args:X-Source-Dir;
	bh=rDs45G4/sDLXjcgOvjotWVbAe+IRrbE/6qMb+/sYF+Y=;
	b=sOlKapFLpjoxWN+G87mABFdwDR5oW1h6xDBifXvU1oFI8+QDtQvteK1Qsfc9TqD230GT
	 qnivqiBL34I3ShetAXi5vXvY5O7dsNvrtEp339mVeErcX0M1a5HK0AKsx1fXCj3BoNEtw
	 INuo9LF9elu3NxcKoXgjNG4IuB1p+necTMAm5cxJwe2xSEOxpwoFPgxiButZDkFUISHM1
	 rSBbHo5+1tt8AHlWi0n6bOm9We92yboQuCQqhFa7xaRKCcJLsDTPETt73RPjP4KRf8HAD
	 8Onr/ElzUTOpUbyDj6T8E2PcCO61SdbCauFfOk7GSsGv4C5IvrBXSJeUu8/wBDYJJ9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=lechnology.com;
	spf=pass smtp.mailfrom=lechnology.com;
	dkim=pass header.d=lechnology.com header.i=@lechnology.com header.a=rsa-sha256 header.s=default header.b=0qQzASpv;
	arc=none smtp.remote-ip=66.235.175.158
Received: from galaxy.gendns.com (galaxy.gendns.com [66.235.175.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F573606A32E;
	Fri,  6 Nov 2026 14:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F573606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lechnology.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lechnology.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lechnology.com header.i=@lechnology.com header.a=rsa-sha256 header.s=default header.b=0qQzASpv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=rDs45G4/sDLXjcgOvjotWVbAe+IRrbE/6qMb+/sYF+Y=; b=0qQzASpv1zx8
	YhZZRtIODVyXqQ5uR7v5hSvP5xucj2xVoVHRe02gtGV1GrgwKNxTY/PDwJn1xBo+Q03XAvOXXLOi2
	/vX4jw4exK1zTzXvnIUrjc5PlHyS6I1S7jF4kpebu24eVKPFn//vx9ETuV7d0kgjwUwVeOw9bk1fH
	U5vRX6FUf8x1M9+ra54pV1rvJVuSbBwJV9z+vjNX28iWWdGF22WsolNbe9PSKLF0pbJEdSt6vZu4L
	TgwnAX3M7v2QayfBZEGCMHT77cEtIZyiY7JTTNmjVEnNJmudOPSAV5qNXauEy7ZhpbZoob9MyRyfG
	2HdTyxzSb6V9/jYzoib6gA==;
Received: from ip98-183-112-25.ok.ok.cox.net ([98.183.112.25]:42166 helo=[192.168.1.143])
	by galaxy.gendns.com with essmtpa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <david@lechnology.com>)
	id 1xPKYx-0000000GhAC-4583;
	Fri, 06 Nov 2026 09:05:01 -0500
Message-ID: <1e1323a9-0567-48f6-84ed-3f3311196dbd@lechnology.com>
Date: Fri, 6 Nov 2026 08:05:00 -0600
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
Subject: Re: [PATCH] tools/leds/uledmon: force NUL-termination of device name
To: Gu Bin <gubin@cmss.chinamobile.com>, lee@kernel.org
Cc: pavel@kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106100614.2312-1-gubin@cmss.chinamobile.com>
Content-Language: en-US
From: David Lechner <david@lechnology.com>
Autocrypt: addr=david@lechnology.com; keydata=
 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
In-Reply-To: <20261106100614.2312-1-gubin@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - galaxy.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: galaxy.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: galaxy.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

On 11/6/26 4:06 AM, Gu Bin wrote:
> strncpy() does not NUL-terminate when the source is at least as long
> as the bound. uleds_dev.name is passed to the kernel with
> write(fd, &uleds_dev, sizeof(uleds_dev)), so a >= LED_MAX_NAME_SIZE
> byte argv[1] leaves name without a terminator and the write sends
> trailing bytes that are not part of a valid device name.
> 
> Force NUL-termination after the strncpy.
> 
> Fixes: fa7f32422ea1 ("tools/leds: Add uledmon program for monitoring userspace LEDs")
> Signed-off-by: Gu Bin <gubin@cmss.chinamobile.com>
> ---
>  tools/leds/uledmon.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/leds/uledmon.c b/tools/leds/uledmon.c
> index c15a39c1f271..6df35b817233 100644
> --- a/tools/leds/uledmon.c
> +++ b/tools/leds/uledmon.c
> @@ -32,6 +32,7 @@ int main(int argc, char const *argv[])
>  	}
>  
>  	strncpy(uleds_dev.name, argv[1], LED_MAX_NAME_SIZE);
> +	uleds_dev.name[LED_MAX_NAME_SIZE - 1] = '\0';
>  	uleds_dev.max_brightness = 100;
>  
>  	fd = open("/dev/uleds", O_RDWR);

This works, but maybe better to just print an error and exit with error code
rather than silently truncating the name?
