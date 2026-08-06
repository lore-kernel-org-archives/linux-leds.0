Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDDD412C17;
	Thu,  6 Aug 2026 14:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786025719; cv=none; b=UMozSQIgJkB+4LukK/lho8KGnI9W9yItkEjK3tiLo3yl0g4pWPWY0XMNU3yTu5SmqihM5cB1Kz+JDtyle5mOWQ1uLvQXUU1wj8JL9tTivaA0SjELDyyYxorxtpSkYw5TivrBRJuLCMD2KEvxPWoAZ6FOWgMK3ms48uGQV7VfgzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786025719; c=relaxed/simple;
	bh=JL6RbqXVUXUjM9PYTOTp6NMJYLoNJZIme37V0bEyWas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQ5donyadKmO9NnfIKNbVq4l+4ebsZqoU7V37PCtSZQFCIIysx2lgVCi0+SJ86hXy5+exov+R5xnbxgAgHn/bnC9zgWSDboZ9oQ7GT0831u08i0wi0b+zvogMU1CKsG/CmXF+DAyIWWS9Qqj4BoteqO2KXU/7kndXCrJZsJlSgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jIWbA4zz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jIWbA4zz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86971F000E9;
	Thu,  6 Aug 2026 14:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786025716;
	bh=Lm+L18sQuTytPSZytt1PUHSEinas5+u2l6z2l63LVQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jIWbA4zz28W8eIMC+9O+rLs97BiuISin6or/xtXYDKQyQUzhWCoObq+sykKrM2ts2
	 AqzxPSW5cNHXSIGj52EA1akkl3/mP+/I7MkDZfh8zCXuTJ/OxmZXx/bU1DPwj5oDXF
	 8DcrMg7ZjPcxBliU975i92Pa/FkL3LlMIQAHzYjt0Xq36I+D3lhJk0FF0uCbXO7vR1
	 HQyOyamgm/Y9yj/3+8MYIa2dgH5m74pDN/MwIWD+ACqLwJScVnDTQPoPOdNgMHJ1Wc
	 IbK0Ovb+po1dzDCl55ZuJ1RSxCo/n9aOnrRb2t4O//FsjNVZQzmsVI4/lrU53O1v8v
	 HJzXkaY3UIWaQ==
Date: Thu, 6 Aug 2026 15:15:13 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Paul Sherman <shermanpauldylan@gmail.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: cpu: use cpuhp_setup_state_nocalls() for
 large CPU counts
Message-ID: <20260806141513.GJ2869284@google.com>
References: <20260727221607.5216-1-shermanpauldylan@gmail.com>
 <20260727222518.B1ECA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260727222518.B1ECA1F000E9@smtp.kernel.org>

On Mon, 27 Jul 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Skipping hotplug startup callbacks during initialization leaves the CPU LED triggers in an incorrect inactive state for all already-online CPUs.
> - [Low] The commit message description is not capitalized, violating LED subsystem conventions.

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> --
> 
> --- Patch [1]: [PATCH] leds: trigger: cpu: use cpuhp_setup_state_nocalls() for large CPU counts ---
> commit 2aa3e021f1cce38c0cc7487063d486ab550d6162
> Author: Paul Sherman <shermanpauldylan@gmail.com>
> 
> leds: trigger: cpu: use cpuhp_setup_state_nocalls() for large CPU counts
> 
> This commit changes ledtrig_cpu_init() to use cpuhp_setup_state_nocalls()
> instead of cpuhp_setup_state(). This avoids invoking the hotplug callbacks for
> already-online CPUs at registration time to prevent boot delays on systems
> with large CPU counts.
> 
> > leds: trigger: cpu: use cpuhp_setup_state_nocalls() for large CPU counts
> 
> [Severity: Low]
> This isn't a bug, but the commit message description starts with a lowercase
> letter. The LED subsystem guidelines mandate: "Always capitalize the description
> after the subsystem prefix for MFD, LED, and Backlight subsystems."
> 
> > diff --git a/drivers/leds/trigger/ledtrig-cpu.c b/drivers/leds/trigger/ledtrig-cpu.c
> > index 679323c2ccda0..ce75d5f54684c 100644
> > --- a/drivers/leds/trigger/ledtrig-cpu.c
> > +++ b/drivers/leds/trigger/ledtrig-cpu.c
> > @@ -163,7 +163,15 @@ static int __init ledtrig_cpu_init(void)
> >  
> >  	register_syscore(&ledtrig_cpu_syscore);
> >  
> > -	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "leds/trigger:starting",
> > +	/*
> > +	 * Use cpuhp_setup_state_nocalls() to avoid invoking ledtrig_online_cpu()
> > +	 * on every already-online CPU at registration time. On systems with large
> > +	 * CPU counts (e.g. 64-hart RISC-V) cpuhp_setup_state() would serialize
> > +	 * callbacks across all online CPUs, causing multi-hundred-second delays
> > +	 * during boot. The trigger operates correctly for future hotplug events
> > +	 * regardless.
> > + 	 */
> > +	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "leds/trigger:starting",
> > +				ledtrig_online_cpu, ledtrig_prepare_down_cpu);
> 
> [Severity: High]
> Does skipping the hotplug startup callbacks during initialization leave the CPU
> LED triggers in an incorrect inactive state for all already-online CPUs?
> 
> By replacing cpuhp_setup_state() with cpuhp_setup_state_nocalls(), the driver
> skips invoking ledtrig_online_cpu() for already-online CPUs during registration.
> Because the cpu_trig per-CPU variables and num_active_cpus are zero-initialized,
> they remain in the inactive state.
> 
> On architectures that do not emit ledtrig_cpu events during idle transitions,
> these CPUs will never call ledtrig_cpu(CPU_LED_START), so their LEDs will never
> turn on unless they undergo a hotplug offline/online cycle.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260727221607.5216-1-shermanpauldylan@gmail.com?part=1

-- 
Lee Jones
