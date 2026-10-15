Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A403BBFA1;
	Thu, 15 Oct 2026 15:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078330; cv=none; b=ke1Ab6HfUIhH5aeUq5HdK3bouzXqX5IykOqeEJB5J3k3dE9wkmI4h+fOxyyidkBL7Rdyf0yDuQCHhOAW8P2PL1xpJXcg3iteXe40YxcNqagtomo/4Gnj8OLKb4WJYr5ATi2kV2ucdJlM1/bvAHzjvieeicItOKS+rt1YE9gKXO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078330; c=relaxed/simple;
	bh=k+8xAeUkGtLHuLTx8KNqawbK3E9Z3JKJVK5FWbRrJQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mp3ZgrfwsnVBUyTcRk4sDx9M1NJUFN46Wr7BLxVxAzTiIIwKegsfT01yIzJ83EtY92KMF2nmGUUAhMEk2FYrP7wZVPJsLPXFYMOzQs6rMS12tLcWij9l+32lGWygB7TUlbcwhGJXdt58PDLSozHEBr3Hs9ulIKrGOtD298nISCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AUoZxXs7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AUoZxXs7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B681F000C4;
	Thu, 15 Oct 2026 15:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792078313;
	bh=IPeR4E13LtSGWjTts33DJOEDaoNsfTVrNBomXjPhAAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AUoZxXs7eqRyQNhNIrUBaJLnz7HEdN4J3qKkkqBpR+Fd3rrVCjzItBtSf4Ngwgae+
	 W5QyHhFVU63dAi/ZwdetPoAtpDICYBBieGNwtJ2CCgDIFZgVa7wWzNTV2I5jHGZapd
	 7N91YCHK+YTlsn7psAhtkqtY/f2QPVa/VUHnVk8wafdb9/+lLaKhXiaEpczbG+XlUw
	 pU95BfTNRvfdOry8JFYXp5RGAv9h8s2IfPz3F86sDvexxUiVryFdM9aMlmR41JDhug
	 N3fdoTtEGBvP0Tr5tcL2lheoC0gC7VAsd8OboSfFumQxlJQTZYx6ZZyR0NirGOidjT
	 mLpr0ZPYWmpEA==
Date: Thu, 15 Oct 2026 16:31:49 +0100
From: Lee Jones <lee@kernel.org>
To: Manush Prajwal <manushprajwal555@gmail.com>
Cc: pavel@kernel.org, dmurphy@ti.com, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: lp50xx: use scoped loop to fix fwnode reference
 leak in lp50xx_probe_dt()
Message-ID: <20261015153149.GC2048969@google.com>
References: <6abde533.1f5d5c08.1fd03.f4e7@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6abde533.1f5d5c08.1fd03.f4e7@mx.google.com>

On Thu, 01 Oct 2026, Manush Prajwal wrote:

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

This doesn't appear to be a real commit.

> Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>
> ---
>  drivers/leds/leds-lp50xx.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index 20bfb315b..d542eedd4 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -458,7 +458,6 @@ static int lp50xx_probe_leds(struct fwnode_handle *child, struct lp50xx *priv,
>  
>  static int lp50xx_probe_dt(struct lp50xx *priv)
>  {
> -	struct fwnode_handle *led_node = NULL;
>  	struct led_init_data init_data = {};
>  	struct led_classdev *led_cdev;
>  	struct mc_subled *mc_led_info;
> @@ -505,12 +504,11 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>  		if (!mc_led_info)
>  			return -ENOMEM;
>  
> -		fwnode_for_each_child_node(child, led_node) {
> +		fwnode_for_each_child_node_scoped(child, led_node) {
>  			int multi_index;
>  			ret = fwnode_property_read_u32(led_node, "color",
>  						       &color_id);
>  			if (ret) {
> -				fwnode_handle_put(led_node);
>  				dev_err(priv->dev, "Cannot read color\n");
>  				return ret;
>  			}
> -- 
> 2.46.2.windows.1
> 
> 
> 

-- 
Lee Jones
