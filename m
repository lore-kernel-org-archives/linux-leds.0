Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EA8377AAC;
	Thu, 27 Aug 2026 13:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787837882; cv=none; b=Epj6u7vZh79hglQEtFkN608Hp1iz5CUpwEHcYX6s0FTsNFVzmpQSgoYKsBvOajlfpvX3UiXHG/NKhpy+22/vcpvsRw6RPKUWOpiLg+zPcXHta07AWs/6IN+s05xZ5STQ3d8pCM61KCFW6+9d5kdfoGFZwSMGF5r7i6Dwp7xuyWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787837882; c=relaxed/simple;
	bh=rHy1abmSY//SLJlyP9T3y7I71atpRIDlo9GzDV78SeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcQrW4UDHPGjSjilKyuE7YrJxTMwpPBdmVcWusOR43aef5kSeSrmyxFOB3QYImzIXJoVXTOohrJVzGXBxILE+zzGuy2xjqYXfe0Pgh7KtHKZfa7xCuMPKxrvZAP4vnWY9rcaTKxRhnV5fa3gtM5wpZL5mo1BOHlKNetloncpX+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fmD9+yI0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmD9+yI0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8341F000E9;
	Thu, 27 Aug 2026 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787837876;
	bh=rhu3+8lhSkVJ+AKix0VoEWkhpLmjUA+bCjlH9jfkmWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fmD9+yI0HwknrT979Gwc/OenIcqSz9X9+l/8sF123x1XqzQIzP3aVwKJZjH6CW55G
	 P1pi8KSVT+fXhUXyecP1Do2rnxWf5aMFDLwRMOCCZy2g/QY/jfTJG4HElXdfFmMyG+
	 eBMu7G1Rj62NOtte3rCJ6KBb1K429+O+fOhd1hS+FgitWpMAYzvjdoAub+8XTFfhe0
	 asvo2jKkHZiYl8j9GjynmJ/v0OjVVHqXpdX9aUOMDtcRE1Z5ZJhUbvAqG6wwUpOnQ8
	 M41Qp/ImVW2I2F/kaesdc+zeHazkC9uBm+l+ShFw0qjH7JYbc01e1FiEurHOXHM1Yo
	 1kwoVrqLo0irw==
Date: Thu, 27 Aug 2026 14:37:53 +0100
From: Lee Jones <lee@kernel.org>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, linux-leds@vger.kernel.org
Subject: Re: [PATCH v6] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
Message-ID: <20260827133753.GM770273@google.com>
References: <20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com>
 <20260717045523.A762B1F000E9@smtp.kernel.org>
 <7e474cdf-fcb2-468d-844d-f8afb5976d16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e474cdf-fcb2-468d-844d-f8afb5976d16@oss.qualcomm.com>

On Tue, 25 Aug 2026, Fenglin Wu wrote:

> 
> 
> On 7/17/2026 12:55 PM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > 
> > Pre-existing issues:
> > - [High] The driver permanently leaks a hardware LUT slot and fails to trigger patterns when a 2-step palindrome pattern evaluates to an `actual_len` of 1.
> > --
> > 
> > --- Patch [1]: [PATCH v6] leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mode ---
> > commit c5b003f7bc9326bf3784a70ad883c39b215ae496
> > Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> > Subject: leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mode
> > 
> > This commit splits out pattern preparation into lpg_prepare_pattern() and
> > adds support for per-channel scaling so the hardware pattern respects
> > multi-color LED balances. It also updates the LUT storage paths to handle
> > the dynamically allocated scaled patterns.
> > 
> >> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> >> index d7d6518de30f2..24b1f570f5244 100644
> >> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> >> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> > 
> > [ ... ]
> > 
> >> @@ -1087,43 +1098,64 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
> >>  	 * duration of all steps.
> >>  	 */
> >>  	if (lpg->lut_base || lpg->lut_sdam) {
> >> -		lo_pause = pattern[0].delta_t;
> >> -		hi_pause = pattern[actual_len - 1].delta_t;
> >> +		prep->lo_pause = pattern[0].delta_t;
> >> +		prep->hi_pause = pattern[actual_len - 1].delta_t;
> >>  	} else {
> >>  		if (delta_t != pattern[0].delta_t || delta_t != pattern[actual_len - 1].delta_t)
> >> -			goto out_free_pattern;
> >> +			return -EINVAL;
> >> +		prep->lo_pause = 0;
> >> +		prep->hi_pause = 0;
> >>  	}
> >>  
> >> +	prep->data = no_free_ptr(pattern);
> >> +	prep->len = actual_len;
> > 
> > [Severity: High]
> > This is a pre-existing issue, but does this logic permanently leak a
> > hardware LUT slot if a 2-step palindrome pattern is provided?
> > 
> > If a user-space process provides a 2-step pattern where both steps have the
> > same brightness, the ping_pong logic earlier in lpg_prepare_pattern() will
> > calculate actual_len = (2 + 1) / 2, which evaluates to 1.
> > 
> > When this length-1 pattern is subsequently stored, it allocates 1 slot where
> > lo_idx and hi_idx are equal. Because they are equal, lpg_brightness_set()
> > treats the configuration as a static brightness instead of playing the
> > pattern.
> > 
> > Later, when the pattern is cleared and lpg_lut_free() is called with this
> > lo_idx and hi_idx, it hits this early return:
> > 
> > static void lpg_lut_free(struct lpg *lpg, unsigned int lo_idx, unsigned int hi_idx)
> > {
> > 	int len;
> > 
> > 	len = hi_idx - lo_idx + 1;
> > 	if (len == 1)
> > 		return;
> > 
> > 	bitmap_clear(lpg->lut_bitmap, lo_idx, len);
> > }
> > 
> > Does this early return bypass bitmap_clear() and permanently leak the LUT
> > slot for the remainder of the device lifecycle?
> > 
> 
> I think this should go into a separate patch, since it isn’t introduced
> by this change. On the fix itself, rather than checking "(len == 1)" to
> clear the bitmap, we should add a new flag to track whether the bitmap
> has been allocated and only free it when that flag is true.
> 
> @Jones, what do you think? Would you prefer that I include this fix in
> the current change, or should I push a separate fix after this one?

It's Lee! =:-)

I don't tend to look at existing issues, but if you'd like to submit a
patch for it, great!

-- 
Lee Jones
