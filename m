Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937533B7B71
	for <linux-leds@vger.kernel.org>; Fri,  2 Oct 2026 12:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790944848; cv=none; b=nU5AoL2D+B6swuJJVhVzpccni8p7WR/sBHjfrzN8AdxJQe3p8X0viBO9QkDZPJsuiCbhI/jRiKiSgNRrwiiM+DPscREuQscGvpWrfNABFIWKDZXU37wG1QbTkPTrdRcJf7gvX3yBQsmMDWutYw+S/9nGh11WWHp1ZrnZrupy5Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790944848; c=relaxed/simple;
	bh=vqjK4slV1N7ra8wRUcxL1SZujEvmpdhLFb5qwVelDzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EOsxGpLpLCpeWB+luabgDMBVLOyykHnX+/xwtDPRvY8G1y3oaI7TGJfefux6OAH4B+zBPIcgI3wjylQb1KBou6A6srs5UfE9LEgPyfg/ENAhMo8P69XbAx8T4d/2o8BIIgeL3XgDwAYdF00kAfiN3L8COLAulN/uBYmLR3NPigA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=e0sySH1o; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WhADyh/s; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="e0sySH1o";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WhADyh/s"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id AFD1FEC02FF
	for <linux-leds@vger.kernel.org>; Fri,  2 Oct 2026 08:40:44 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 02 Oct 2026 08:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790944844;
	 x=1791031244; bh=X1fUnTyojVOzVIiPWbG7G4BS8AHa4mHFcS9JswnI+J0=; b=
	e0sySH1oT2BRYNbVN6l0FN9qjwRmHfZ5SkSqY7EbDKQBF3fMSzfhETdVNQHusOWo
	m9C+eCtjmsLFlr8t3qOuG2yyUCj2p+37oOMn9nSXK9iqG5JwWsjUfc5QCldpNpn0
	iACmDB4wD1KDcmv70dk4kPgxRxRAvC8pVjr39JAfX7Pf8cIu03ebQ+7/qTKIViDL
	T2m3yA9+eYl05QEM5AFbBpHgYheNHT/9zWV5pKs1PmWPMvNRI8OahudyLXfZGW8z
	xj9hTnTHJfSo1rboqmXL+oad69V1/i6OuT3kFhM0VhJS9vaHQIY4pkFu2i/3H+uX
	UvRUjzCrMmVc2F7APJqmww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790944844; x=
	1791031244; bh=X1fUnTyojVOzVIiPWbG7G4BS8AHa4mHFcS9JswnI+J0=; b=W
	hADyh/sO/CeHS4B+fbhrg8b/UbslNiRnCBkWup+rcu2wesf2XH0LDWPkHbtZOysW
	Bvn5E9OuZZnHCbLcGQshtKUkEfrmMYE1SSI20XtYvsSLvcYucaHaEY3IPxLe7y50
	riUGQQZFptqZla6xqECC8O0UddQHzJ+FRRflwugVeT+auJp9VtzOJ21UbCas9fjT
	dxScSSKr+9a+rYt4H50BiHXX3zyE8ZDuKFTkLQDOYpcMDIEN99oeahofPuwaUZW7
	v0jkp1oBNU+HNyA5TncfMsBtbPRCSMNQiFX+l4qoGApLn1h37ZEUW7ChLuMZxlIB
	msb7PAKheOC1uovFWYFXw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790944844; d=kroah.com;
	mf=PGdyaWZmaW5Aa3JvYWguY29tPg==;
	rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:mIS2+yxpIHHnD+hRtJiwq18LG3ca7/U8CwN3SupQxdmsbtC
	nRfNV35/CjllWJPIl4sgLxszD/rbJ5jkoS6UFOt+nV4r+juhR+MYHumU/dhRKuHi
	gv37PaRQwoIE/bygAB07UiQ4aVmEoRdjOys26DN4xoVMCUexa7cTokIDJ1sE41R9
	Ga0b4GloqJk10HMCUSPh2WGM4aftOi5ptrW4+eq9m9wJ+fmjMFmQLyl5cUPIKW0W
	LT1rKa/QhEIRYlETrAG+yZ0rSd2vQOlxbmt/LErhfjM0kh/LmSriWaImmnj7R9oA
	eljmUXQrmIvIjHMgliUmBJq0Y6B4cHd8/fxqbpQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:hDqUd+Z+Ldk0J5ss6uXfxd+uCSED8Z8itM8peJLNXxU=:vqjK4slV1N7ra8wRUcxL1SZujEvmpdhLFb5qwVelDzw=;
X-ME-Sender: <xms:TKa_anJmtaBZPyGNDSYPz0WVHmXiWPL7CuceObgZxiHgRGDKHZlB1A>
    <xme:TKa_ar7Z1BoyJwCCGDZN2QMZ76emT8FgDKXMDuwIN6BXfobja6oQTRYJSZahXBbsR
    6UbledvniKMBJt37_xF2QEEAJeSLiQsZdsupCwsxopripji2oSpnw>
X-ME-Received: <xmr:TKa_ar2ImbbcOkFQmR-4JltLXwOHd8w9YHZ_PSMVcPlo2GCkqdlmBmPraNNSGBHNckPDvNqQz1iU3cpdh0LG24Xv8DXPdD7bBxtn>
X-ME-Proxy-Cause: dmFkZTEkT0xFaS48rHxJ4MGW/YcpmIEsfMb9aj10DLH2763n3AEUz0QFSPruhCqFZgC83X
    oawLTHM18kNrqMuwtJWjHaHZZ5ZJoow0pckvNDPVKSeBlXf+MqF3rAsFwVCTjrkuQqAEXZ
    o4yOHp7+Ql0SBJpwzqD6o2D/+sY/hGOTArU7jRz6ij+kts8oUZvVgQ8yR4EYTB1PtHTvH2
    NnpWbKG0/+HPULKl1JY0YFNWsIU44HKtods/ZSiSAJlQxzIX31sBYm4W5haqz7JJvS6HUi
    frbekWbJoD0mahd4KTsAbDq/wVkdUQOARnu11uYmbhFn6xeoqVggNyFwumyUtTGb9N3uEE
    up65UEVKr8izlIAj7BwJjtDHmu8j4/8YUwZIFi2pY1MwpmIghI/UPSATwNzfqTzNVRjJSr
    AjeGqDKokLGU8humd33joONC9l/vMPCWomHbgen1SvRHgMKitzb1lRQGchZMa9rCdq6So5
    dm3zQNF5kT9oo7vf0MW+zQKcp5x8WpBOqABSXYTt+TYGygTBW/3dpwWjvp8pgN7EPa+qYJ
    ZALzoLjtfyav2bqTE0p0oMweXNzL3pPk7tK6UvibwLjLaIgu6S5N3RWPSywheKqqzUiwhM
    UqCpqcWdxSPfDJLMTgaYolgqYaBoUy87wR+9jKFP4zpYmjWY5Eq3wQzM1PRw
X-ME-Proxy: <xmx:TKa_ahd9fbJY94wA_jPdExiDPNVykZ7S4mQysB-yiiCpHYdgtNx81g>
    <xmx:TKa_ahfx0v9E8-eaUeydjvFgTGGGs3k1-r4Xnix6W1UBMZbnRMuhTQ>
    <xmx:TKa_asws44_ZOhZ_c5YRF1g9VO8JBYosrlN_D6Ew3AKY7Jumnb4cgQ>
    <xmx:TKa_ag_JuCA03uoshXhGzX_ZQ5x5FID40VNWT5pIWGDM0ERy9AgFhg>
    <xmx:TKa_aooszoGoYVT5C61LEgix_zINcRXWtVnK1srFk3edqcVFlT_HaVR->
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Oct 2026 08:40:43 -0400 (EDT)
Message-ID: <90eac3b0-cc01-4616-8007-2f7750398dd4@kroah.com>
Date: Fri, 2 Oct 2026 14:40:41 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: lp50xx: use scoped loop to fix fwnode reference
 leak in lp50xx_probe_dt()
To: Manush Prajwal <manushprajwal555@gmail.com>, lee@kernel.org,
 pavel@kernel.org
Cc: dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <6abde533.1f5d5c08.1fd03.f4e7@mx.google.com>
Content-Language: en-US
From: Griffin Kroah-Hartman <griffin@kroah.com>
In-Reply-To: <6abde533.1f5d5c08.1fd03.f4e7@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/26 6:44 AM, Manush Prajwal wrote:

> In lp50xx_probe_dt(), fwnode_for_each_child_node(child, led_node) iterates
> over each sub-LED child node. If fwnode_property_read_u32() for "reg" fails
> or if multi_index >= LP50XX_LEDS_PER_MODULE, the function returns -EINVAL
> without dropping the reference count of led_node, leaking the fwnode.
>
> Use fwnode_for_each_child_node_scoped() to automatically release led_node
> on all exit paths, eliminating the refcount leak as well as the manual
> fwnode_handle_put(led_node) on the "color" property failure path, and
> remove the now unnecessary function-scope led_node variable declaration.
>
> Fixes: 193910c2c54e ("leds: lp50xx: Add the LP50XX family of the RGB LED driver")
> Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>
> ---
>   drivers/leds/leds-lp50xx.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index 20bfb315b..d542eedd4 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -458,7 +458,6 @@ static int lp50xx_probe_leds(struct fwnode_handle *child, struct lp50xx *priv,
>   
>   static int lp50xx_probe_dt(struct lp50xx *priv)
>   {
> -	struct fwnode_handle *led_node = NULL;
>   	struct led_init_data init_data = {};
>   	struct led_classdev *led_cdev;
>   	struct mc_subled *mc_led_info;
> @@ -505,12 +504,11 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>   		if (!mc_led_info)
>   			return -ENOMEM;
>   
> -		fwnode_for_each_child_node(child, led_node) {
> +		fwnode_for_each_child_node_scoped(child, led_node) {
>   			int multi_index;
>   			ret = fwnode_property_read_u32(led_node, "color",
>   						       &color_id);
>   			if (ret) {
> -				fwnode_handle_put(led_node);
>   				dev_err(priv->dev, "Cannot read color\n");
>   				return ret;
>   			}


Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>

