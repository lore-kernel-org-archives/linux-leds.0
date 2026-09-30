Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB2C511227;
	Wed, 30 Sep 2026 14:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780333; cv=none; b=fy19sBwfkhGkKquNl7dtZS7hNA+vCAk67+zVflEy5vIA0rPnYm1+eynvNzLEKVpe2+eDRAWsIpk5kq3VZXTZ99q82jL84j7VxRSThwn6aesapk3+J5qr01qC8vd5Bwab/wjoX1IHtoX8ZgduX5r/0gn2xXVidCgs3BHpbV5yvA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780333; c=relaxed/simple;
	bh=KXwfS7dOesplNsvN8WR3YoLLgnZMbO3JB+H/onFWdeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h4Iz2WF77ZAYWDR2zBQyDsQ3vVt/2MTgbS+lJZsT5YMIYphUkNVXAOt3LusZcJB4ZDZIfNGVGcXE2AG+5Z7bq/+1hn/grUtzuRsnq6GrC9xCUz6LfBXJxGkYqSaqrexIQhYh0xx2lDcP2wtoAbocR5KshRuuV6oCf200iXG2wyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=l84tTS8F; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Jcn3U/py; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="l84tTS8F";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Jcn3U/py"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 17B867A06D4;
	Wed, 30 Sep 2026 10:58:39 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 30 Sep 2026 10:58:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790780318;
	 x=1790866718; bh=aofGckP8hMwHNg+V2dNN47NOQ2mL8aBwuetiA0KNeSI=; b=
	l84tTS8FrgUObf7LAd5E7HXrG0aQTA3E7zZ92aS6oogpSpg3NpbYcYSIc+mG2z3v
	HnV4ZSq45l2+HfvzOjInHq8FEV9fOs6Xr0e3UnwggfK2MK2W3yK3t4y+AjcUVjoJ
	veb+SrCsLAVs1SKVq3LGQXAgOjjOQuWyY6UmkX2F7S5T/sOhi8oCgyoCAIqyiSUQ
	gKCs9+QDtAEbK0VDulgYJQSqXoaghxAipTOyIN7suAHeVOykBqIYP4ixOORjczIQ
	xdD2ea1ShJ9eIL0lcYAdCOdQzLMe3QENszU1naI2SFa4MphZt8ovTmJy4eR1JQAI
	+dzfXHG7+81b3TZzopwjxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790780318; x=
	1790866718; bh=aofGckP8hMwHNg+V2dNN47NOQ2mL8aBwuetiA0KNeSI=; b=J
	cn3U/pyV0fIorRo0sZVuQgzgZ+QPC/Kz3MThX7NR0Wx3IOzag7PcRL3cXdfs6Vmr
	HzMZ8Mp6XTvjaGRyGcziBu4mfyD49W10X3Z/n4xuHqKVa9j7U7AKwoND5RR4Uirr
	2MY/qriM0a4cG5QrjUB2bsJOkyH5IcI+OJIKv/lHhpfV36JXGnXi9Wuw2a6n8xmm
	ClYxxoM3p1N7FevxgWaHiLw4RRfILh86ZAvAocHRyqgMyJk9HEnIFzmT1HdI0KXW
	6J5P/oWJGhToX7yroVlT1qxHMRHT+N6MxjJKg0e/5pj3tkTIxXu6L9eerEKWTo8V
	dq2QvPx5B0+YjhoomGUxA==
X-ME-Sender: <xms:niO9agR179xb22ZoDlQSeTT3t8fQiKXnLZLm7-70ysCff7eRV_gmQw>
    <xme:niO9aoJ_-xNahCp-iXTdpJjIBOwESZqpnjEMyIX0tDQPmFuAT6DTFI1Hk_Su_DB1r
    prlvZ5_9qzZiTnf_aC9HKd7GCBAwpa03O3FkjIDqtAoRbm17gqs>
X-ME-Received: <xmr:niO9aj-2QmuIO8_HgN-bm86cdtJi4fSB9kc_M4aiqqftDjJAqTXYUoC7VcZCv9gK1lfHj8qKyWO-Fh9azhInzqqpKW4wVHRtijG->
X-ME-Proxy-Cause: dmFkZTEfD0mdmb3Mswe3ZZUc/QdaTwn+jvczmql0T6GcD8zVP1X1Sv5Ylp2gALOomBkT6w
    Swna1BvEtdPZHclHWMblCv18WVXAEZVgVfA3DnXI8FzjZgvuOGWBFlDqkOTNstrmz/datp
    zF+oWRUNjhP7lj/rVgNqPjx/3Dk98q9cXhQIpVBjP8/eUAuufEXzl8pE0ZuuRkqVaV+Z2e
    XLyJw5JEG3ynojpF8CX3Hy62m7xWko9wrspssg1zuThW80rgsGz3/0ARzgloOzVoCDbiKj
    xMyG3OUrult6K/ubPtEDNZkcBxfrVGLQLlXkmqBQvmhiRS4wjjImDTifq+8aEN4meM4gl+
    rI0SNd+68pmQ7ncgvEQUP4uNlAWWvN4K6blNoVg33wSu9Q9O13fpzQ7JP0eeUArmH6FjWR
    4Mi8mymglJbRM+KdpLba+bO8qpwN9IoDloLcT6KrGNdYcR7Lj5K4kawLtRHTNnrYmDzE9o
    0/6GCXp5OH2YHjO8vSEmqBNhX2M+jCT6OGCb57+Y9l2OaN7qUGIL3eDHKXZaM7WhDi1XNV
    /TWjwvB4WihRx/eka28k+d6WHtJU4pkCNIVEygapbzRFYWpDv62AtjIxXqXMHJzKUe57PB
    yTODTDqtYqcmG8phaHMAkQi8dxg7TuiAD6jNy2acnR9mwtExr9Cgj11O+k1Q
X-ME-Proxy: <xmx:niO9avJWn1pbhP9F60yhDK-MqKkhb2ILQfaB0GexNRcgEAKIHGRUOQ>
    <xmx:niO9aiF2OFXRYovVgb1FCRUY5iKOOIBp8YhTBKm4pFz_DOik_fNU_g>
    <xmx:niO9ajxlQrvi8poANEbW3qymjW6_1RECyH0EzbfQSGSNV3gWiDiSGw>
    <xmx:niO9ar5ybB4JzECTrFvzykhkMXkO_KHWCkSiofPKhXTYBU0OQ89EgA>
    <xmx:niO9anopPXxc0AwqBNLL6HfQooJH_JIEQslV96cWIS1rWfA6E2YbOA3V>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Sep 2026 10:58:37 -0400 (EDT)
Message-ID: <3879be34-5389-4115-aeb2-29ba58228392@kroah.com>
Date: Wed, 30 Sep 2026 16:58:35 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] leds: pca995x: Fix maximum LED index for
 16-channel variants
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>, Lee Jones
 <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Isai Gaspar
 <isaiezequiel.gaspar@nxp.com>, Marek Vasut <marex@denx.de>,
 Pieterjan Camerlynck <pieterjanca@gmail.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux@ew.tq-group.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1790684839.git.nora.schiffer@ew.tq-group.com>
 <3926421f5734083348a6dc3e3c0d60de5d75a067.1790684839.git.nora.schiffer@ew.tq-group.com>
Content-Language: en-US
From: Griffin Kroah-Hartman <griffin@kroah.com>
In-Reply-To: <3926421f5734083348a6dc3e3c0d60de5d75a067.1790684839.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/26 4:25 PM, Nora Schiffer wrote:

> The pca995x_chipdef for the 16-channel variants PCA9952 and PCA9955B
> correctly sets num_leds to 16, but the value was not actually used when
> checking and iterating over the LEDs during probe.
>
> Fixes: 68d6520d2e76 ("leds: leds-pca995x: Add support for NXP PCA9956B")
> Link: https://sashiko.dev/#/patchset/6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---
>   drivers/leds/leds-pca995x.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
> index fee6216cd1bd0..8b05b3f12cf38 100644
> --- a/drivers/leds/leds-pca995x.c
> +++ b/drivers/leds/leds-pca995x.c
> @@ -146,7 +146,7 @@ static int pca995x_probe(struct i2c_client *client)
>   		if (ret)
>   			return ret;
>   
> -		if (reg < 0 || reg >= PCA995X_MAX_OUTPUTS || led_fwnodes[reg])
> +		if (reg < 0 || reg >= chipdef->num_leds || led_fwnodes[reg])
>   			return -EINVAL;
>   
>   		led = &chip->leds[reg];
> @@ -157,7 +157,7 @@ static int pca995x_probe(struct i2c_client *client)
>   		led->ldev.max_brightness = 255;
>   	}
>   
> -	for (i = 0; i < PCA995X_MAX_OUTPUTS; i++) {
> +	for (i = 0; i < chipdef->num_leds; i++) {
>   		struct led_init_data init_data = {};
>   
>   		if (!led_fwnodes[i])
> @@ -169,7 +169,7 @@ static int pca995x_probe(struct i2c_client *client)
>   						     &chip->leds[i].ldev,
>   						     &init_data);
>   		if (ret < 0) {
> -			for (j = i; j < PCA995X_MAX_OUTPUTS; j++)
> +			for (j = i; j < chipdef->num_leds; j++)
>   				fwnode_handle_put(led_fwnodes[j]);
>   			return dev_err_probe(dev, ret,
>   					     "Could not register LED %s\n",
reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>
