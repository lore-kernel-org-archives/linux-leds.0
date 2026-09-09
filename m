Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A717560AB3;
	Wed,  9 Sep 2026 16:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970800; cv=none; b=WslOYYSoM4eiH+fDl66o7hWBqKWvXHtvQ+xUoSO8edE+AV9Ybb/uMXOL6BUWmkaGxg7o0xa4/5wd6CgvO4/Osnx62DlLvPku7hbBYig6GM+ytq8FjQINqbWt5jOz04pNTthr513VC+8mDQNZjCZ0j+KJWR6sYN/yniMR3y6aj6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970800; c=relaxed/simple;
	bh=DaIr3NY8wviR/A+alKx/lsBMPCrp7adjDt48VSszqEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sbXrgoktB0LaCI2Q5vhn8pAqbyHSVEfO4Um2ihvqb08zNC1LmrJtYWTsGU8ADMLZLh/nUJgDj0j6IbkrQLmy2bbax6ncS8nCoHYnZQGREsDwE1WK9ATnLILNDdjIL2/pakCyQtYJTsyJAkm92mg5SrqcIZlb+OBb70s7Wi1iIbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uj5sQlnP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uj5sQlnP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0AE81F00893;
	Wed,  9 Sep 2026 16:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788970798;
	bh=XbgCQ/elEM6/7L8TqD5RTRMC7maqqbXkk6VhSnSd9v0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uj5sQlnPlNRb8SpB1ZUE9QOYvaZ0NTx4J71ja5/LhUrOjmGuOHbLZaeXW9fioxc0P
	 iGvEP0h5FhdxZ5OZ7yfMHasEvaXThbnnB6GTgLOANCjNaaF7cZ/riEDystcVRjeAit
	 ScP3/4nActueJfscptVPe0LzbU1FsW50190EBvIC7BmxJm2A6eR/kRoZsLHNd/YTIX
	 Epc71eQ5Oe2Ce3CHjriV+RB9pjojnkOOS3Owkee5CdaWBMkRsOeHZdZlEtwdU/5AB6
	 TL3Vt/SGs61rGENLR49GmH2ZliKUaLX1bDDx5hWJ6r8Gm/FZSvi3yWF4540ANMNTTw
	 EinS90BHmLKgA==
Date: Wed, 9 Sep 2026 17:19:54 +0100
From: Lee Jones <lee@kernel.org>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
	David Collins <david.collins@oss.qualcomm.com>,
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] leds: rgb: leds-qcom-lpg: Add PWM frequency mode
 support
Message-ID: <20260909161954.GH2133376@google.com>
References: <20260827-lpg-pwm-fm-support-v3-1-88ae5208c57b@oss.qualcomm.com>
 <20260903153028.GU2133376@google.com>
 <dd810d52-ab6e-4e8b-ae97-32a140490cc1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd810d52-ab6e-4e8b-ae97-32a140490cc1@oss.qualcomm.com>

On Tue, 08 Sep 2026, Fenglin Wu wrote:

> 
> 
> On 9/3/2026 11:30 PM, Lee Jones wrote:
> >> Certain PWM channels on a PMIC (e.g. PM8350C PWM4) support a Frequency
> >> Mode (FM) that can generate waveforms with more frequency points than
> >> the standard LPG PWM mode. The trade-off is that the duty cycle can
> >> only be fixed at 50%. Add the FM support. When the PWM channel is
> >> requested to set a duty cycle to exactly 50%, use FM mode by default
> >> as it provides a finer-grained frequency resolution in that case.
> >>
> >> Also, guard mutex lock at the top of lpg_pwm_get_state(), to make the
> >> register read atomic against the register write in lpg_pwm_apply().
> 
> > Would it be better to split this submission into two separate patches? One to
> > address the locking in 'lpg_pwm_get_state()' and another to introduce the new
> > Frequency Mode support.
> > 
> 
> Sure, thanks. I’ll split them out and submit them as a series.
> 
> Do you think if I need to combine below change in the same series, even
> though they are not functionally dependent?

Your call.  I don't mind either way.

> https://lore.kernel.org/linux-leds/20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com/

-- 
Lee Jones
