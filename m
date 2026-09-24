Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678383FDC06;
	Thu, 24 Sep 2026 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239037; cv=none; b=PBvpsZs47Q+UNuJGNgO33p80gOMuBGRva87dtxA25gsqAduFAMNzRd4e4Ze44X8BSpsXwH9/VEMJ5/qIvnRV/rVOox5/IegpfIcdzbZ9vclw4UX9/Lkna7jBLiDtVqzpTBI4gBairIpRqh0l+eD4/+0YoIEJi3mg+NA28KxzCrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239037; c=relaxed/simple;
	bh=r/vBo1dv/pEBxUbQ9g7cwJrRcatBAi11+dXpZWCqjS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PE3PJpfm6T9EWytS3YsLEHfH/yT8QtK1HTtafMDmFP1+7Wxo3F8xrDlcBJCVwFwNGyIHRCCvvZqt4LmkWNufFKYABWhptPZ1NsIlV7142rGw3Wnf7HJL2vDaf1i0sEowOxDuh0qoZHVQvhpjwalz4d2HrrpZP3Y6EqbXO8Fpsuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8BxRoPW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8BxRoPW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9901F000FF;
	Thu, 24 Sep 2026 08:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790239036;
	bh=9dNpIiCngfqS48fDbzhesrqx5NrLounR6SeZVDzxP8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n8BxRoPWmSo9uf+mopPXmF9iAKyVgVre1+tPUkxjhxcD4AzQ6b0oF0OMFVb82h2n9
	 p1s79k+rFIUQ2BmwgLqu+i9LQkKiMpjvRjfoKgTXDohRp+0sF+60oIRvwCCMnN7xl+
	 XevS1thLE2eO4fD5mB8k5ylTFf7kXaUNC4CTPKU16429Nm33GMPNkQDI7yfQZso+xM
	 l+WuFJhRc6CyPHfqtptjzvLljEKgjbp2Ovd5dpXBpYvblvFi8az97xbsF53OpHftn2
	 qKz5tMP83HAYOm4okEy8zxQqvnhMGMTIE6JPFR0bClf/CeUGY1CcD59ud1dled8xY+
	 g+vbo9+Hx+Qcg==
Date: Thu, 24 Sep 2026 09:37:09 +0100
From: Lee Jones <lee@kernel.org>
To: Rong Zhang <i@rong.moe>
Cc: Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Vishnu Sankar <vishnuocv@gmail.com>,
	Vishnu Sankar <vsankar@lenovo.com>, linux-leds@vger.kernel.org,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v7 02/13] leds: trigger: Move
 led_trigger_is_hw_controlled() to the right place
Message-ID: <20260924083709.GA331088@google.com>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
 <20260921-leds-trigger-hw-changed-v7-2-fe3cdb6dec51@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-leds-trigger-hw-changed-v7-2-fe3cdb6dec51@rong.moe>

--- checkpatch.pl: clean (0 issues) ---

On Mon, 21 Sep 2026, Rong Zhang wrote:

> Currently led_trigger_is_hw_controlled() is placed at led-class.c, which
> is not an right place as it falls into the triggers namespace and does
> triggers stuff.
> 
> Move it into led-triggers.c, and split it into locked and unlocked
> variant for convenience.
> 
> Fixes: b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of hardware controlled LED")
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Changes in v3:
> - New patch in the series, the dependency of the following patches
> ---
>  drivers/leds/led-class.c    | 10 ----------
>  drivers/leds/led-triggers.c | 19 +++++++++++++++++++
>  include/linux/leds.h        |  8 ++++++++
>  3 files changed, 27 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 4259533dafa1..7110bfbe3b83 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -27,16 +27,6 @@ static LIST_HEAD(leds_lookup_list);
>  
>  static struct workqueue_struct *leds_wq;
>  
> -static bool led_trigger_is_hw_controlled(struct led_classdev *led_cdev)
> -{
> -#ifdef CONFIG_LEDS_TRIGGERS
> -	guard(rwsem_read)(&led_cdev->trigger_lock);
> -	return led_cdev->trigger && led_cdev->trigger->trigger_type;
> -#else
> -	return false;
> -#endif
> -}
> -
>  static ssize_t brightness_show(struct device *dev,
>  		struct device_attribute *attr, char *buf)
>  {
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index b1223218bda1..bf2543538ed0 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -7,9 +7,11 @@
>   * Author: Richard Purdie <rpurdie@openedhand.com>
>   */
>  
> +#include <linux/cleanup.h>
>  #include <linux/export.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
> +#include <linux/lockdep.h>
>  #include <linux/spinlock.h>
>  #include <linux/device.h>
>  #include <linux/timer.h>
> @@ -33,6 +35,23 @@ trigger_relevant(struct led_classdev *led_cdev, struct led_trigger *trig)
>  	return !trig->trigger_type || trig->trigger_type == led_cdev->trigger_type;
>  }
>  
> +static bool __led_trigger_is_hw_controlled(struct led_classdev *led_cdev)
> +{
> +	lockdep_assert_held(&led_cdev->trigger_lock);
> +
> +	if (!led_cdev->trigger)
> +		return false;
> +
> +	return led_cdev->trigger->trigger_type;

How does this not cause a compiler warning?

This needs to be evaluated properly.

> +}
> +
> +bool led_trigger_is_hw_controlled(struct led_classdev *led_cdev)
> +{
> +	guard(rwsem_read)(&led_cdev->trigger_lock);
> +	return __led_trigger_is_hw_controlled(led_cdev);
> +}
> +EXPORT_SYMBOL_GPL(led_trigger_is_hw_controlled);
> +
>  ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
>  			  const struct bin_attribute *bin_attr, char *buf,
>  			  loff_t pos, size_t count)
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index a515f075c29a..46ad2e03e1c6 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -534,6 +534,8 @@ void led_trigger_set_default(struct led_classdev *led_cdev);
>  int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trigger);
>  void led_trigger_remove(struct led_classdev *led_cdev);
>  
> +bool led_trigger_is_hw_controlled(struct led_classdev *led_cdev);
> +
>  static inline void led_set_trigger_data(struct led_classdev *led_cdev,
>  					void *trigger_data)
>  {
> @@ -584,6 +586,12 @@ static inline int led_trigger_set(struct led_classdev *led_cdev,
>  }
>  
>  static inline void led_trigger_remove(struct led_classdev *led_cdev) {}
> +
> +static inline bool led_trigger_is_hw_controlled(struct led_classdev *led_cdev)
> +{
> +	return false;
> +}
> +
>  static inline void led_set_trigger_data(struct led_classdev *led_cdev) {}
>  static inline void *led_get_trigger_data(struct led_classdev *led_cdev)
>  {
> 
> -- 
> 2.55.0
> 

-- 
Lee Jones
