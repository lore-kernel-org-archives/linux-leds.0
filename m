Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198245;
	b=opvFs5MXMOFWdZ55AFcCracJHcLljVTa4X1TWK1YFJW07kIP5+rqfL/xXWpb/TwreKvO
	 avxI4r+gkZDBqHwqEjU0nWcPNH8PwXXGFzk/x069lr6ue5VZO+NwvmhqYaKeIUYD0/14r
	 CjJKZCQbzJnbKEVvij1DG8T3yT/7kNC/nqRtnsYx2wD3SgCvVTTZWywdQDUHrpStuos6s
	 GBhGor7p8t8oIb3esUTlKDRQreFHaX+8Eb3V8HsCHUJeS7FGrWHzcOOPoIAOeUd0wuF4n
	 0ZFUmrCogyqQWhwCOyqzKR0eUFo+XgGugzGYAL63iPTxrC2rE5Qvm/ZFTUwXJesrXzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198245;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=2GSJb2Ef+xHdoxKrqms4kNytjyE5DiInki1+4FCz33c=;
	b=AO69zJacnq21bjq7L0II8LW8X3155dgeGze8QHJQs/R5my88BYZ0eawjlzMoROQJwNeb
	 wNevVWEBtUjt6IM/4EjnyqNo1/Q3LS/2elei3Oq2XA9Aol7d5K/KFSNAfFx62jBTk3vWy
	 1zEXSHetVTbp9YskpZfRWHAMxT8HfKfoTGnlNC+IH58TZQExw3+h2hgyhloRzbh52hdGv
	 R44VJBx9mre4Tihm0gZDodWCbYjnkm+8MIC8Xkbd6zFizwKhxG/zE5n7Bvo7woIRVqlxk
	 wVSuzfGAMNzDro4d48BETzF25HMEf/7N3Z778EW7zSgLPVP6t3Dy9DORYZP0YmbsjQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VieSFjqU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AA2606A323;
	Wed, 28 Oct 2026 14:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VieSFjqU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0141D1F01825;
	Wed, 28 Oct 2026 14:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793198244;
	bh=2GSJb2Ef+xHdoxKrqms4kNytjyE5DiInki1+4FCz33c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VieSFjqUDh7ixhoaoxc9O6b9dVOdlCmPrQ8SFoHcVrmKELjAAgQXBacHt4+7H+XZs
	 uNxMlFxYZ2wAzOf5DMF2ViKttdU1eQhHIO69EhaAqyXGcAedOmSiPVSxn24r0imSB2
	 6UALCjg5e/4M7xKEYuMtLwdfQYJXAADoa4NLYHh8JMiISOYOvUUz32/pX3Yd8G44rd
	 /i8Y/NXZJ0r+yP2++jbH/kGyUxoVp9HI+F4EvEmWlp557tndak54aVA0JkEiefGFc4
	 9wEHCrVcNBoF5A86LL6wWOy/bG5HTn7FHW9SkEBDU8IRQuyE96plN6TB5orXmzCDGh
	 4NuJhq44hHQNw==
Date: Wed, 28 Oct 2026 14:37:21 +0000
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Jiale Yao <yaojiale02@163.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: tps6131x: queue torch refresh work on
 freezable workqueue
Message-ID: <20261028143721.GA3605912@google.com>
References: <20261016100435.2581303-1-yaojiale02@163.com>
 <20261016100435.2581303-2-yaojiale02@163.com>
 <sashiko-outbox-174141@kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-174141@kernel.org>

On Fri, 16 Oct 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] leds: tps6131x: torch unintentionally turns back on upon system resume

This needs an answer.

> - [Low] leds: Commit message description is not capitalized
> --
> 
> commit f183582cffa51c16f099031455716678dcb8eab8
> Author: Jiale Yao <yaojiale02@163.com>
> 
> leds: tps6131x: queue torch refresh work on freezable workqueue
> 
> This commit changes the torch refresh watchdog work to use the
> system_freezable_wq instead of the non-freezable system workqueue. This
> prevents the work from running and attempting I2C register writes after
> the I2C adapter has been suspended.
> 
> > leds: tps6131x: queue torch refresh work on freezable workqueue
> 
> [Severity: Low]
> This isn't a bug, but the description after the subsystem prefix should
> be capitalized. Should "queue" be changed to "Queue" to align with the
> subsystem conventions?
> 
> > diff --git a/drivers/leds/flash/leds-tps6131x.c b/drivers/leds/flash/leds-tps6131x.c
> > index 5c9a5af5af05c..841a6538e75e1 100644
> > --- a/drivers/leds/flash/leds-tps6131x.c
> > +++ b/drivers/leds/flash/leds-tps6131x.c
> [ ... ]
> > @@ -307,8 +308,9 @@ static void tps6131x_torch_refresh_handler(struct work_struct *work)
> >  		return;
> >  	}
> >  
> > -	schedule_delayed_work(&tps6131x->torch_refresh_work,
> > -			      TPS6131X_TORCH_REFRESH_INTERVAL_JIFFIES);
> > +	queue_delayed_work(system_freezable_wq,
> > +			   &tps6131x->torch_refresh_work,
> > +			   TPS6131X_TORCH_REFRESH_INTERVAL_JIFFIES);
> >  }
> 
> [Severity: Medium]
> Does this unintentionally cause the torch to turn back on upon system resume?
> 
> Because the driver does not set the LED_CORE_SUSPENDRESUME flag, the LED is
> not cleanly turned off and its workqueue canceled during suspend. Instead,
> during suspend, the hardware watchdog will automatically shut off the LED
> after 13 seconds.
> 
> When using the previous non-freezable system workqueue, the handler would
> execute during suspend, fail to perform I2C transfers because the adapter
> is suspended, and return without rescheduling itself. This cleanly broke the
> refresh loop.
> 
> Now that the workqueue is freezable, won't it simply pause during suspend
> and thaw upon resume? When it thaws, tps6131x_torch_refresh_handler() will
> execute and force the torch back on via I2C, which seems like an unintended
> behavioral regression.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261016100435.2581303-1-yaojiale02@163.com?part=1

-- 
Lee Jones
