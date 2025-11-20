Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACD232D7EC;
	Thu, 20 Nov 2025 10:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763635461; cv=none; b=S750CIfyqvhhIj59xs1c5LzQTUb1vPfprJpUuwgr3eiCfx0XDH/LKuNDaLHnSoLpM1Wb06EdiaZTyAV6DshH2MBw9qtHs7ONJy4ZUJ+C8iRCouCM0jDfLQuq6962ifnC7qabaCp+kJsjWHKsl+lftyEl7I3ziHc1roqmWgWNEC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763635461; c=relaxed/simple;
	bh=8RuH9W0zWkwEPjxF+A/rZR6va/xvHOrYqhvnHOoZ1bA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UF4lsHN9gSL06/seRhsF5mfq6fhWmcfhFDS+wx2s7yRPzSTAgMYqonTxlu7rtrYJMFgtUas8fPL8hF0AaMxYL9gO3mu2OkeRSPMgH3iNz8UndOGNOPwObwXDGBpwbbXtndXb1xiKg1H0Iz0a+fdytnJM7ywdYlNU0bSp+9CQmZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mp3x/uYm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mp3x/uYm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECACFC4CEF1;
	Thu, 20 Nov 2025 10:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763635460;
	bh=8RuH9W0zWkwEPjxF+A/rZR6va/xvHOrYqhvnHOoZ1bA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mp3x/uYmI8WmvmL8b/0tSnLc8Ky74WumHM9iiIb+24u3EHhA5TyGf/IoeV+z84zqc
	 +x37/bFDzdqBl/BgxxG/xRqP5x/y9UeZ+EKRc+q46uL7bF1umlGXO17d/PFJmGGNRq
	 JeIcwJmnG09KTAA0KFXUKLDKwOWBTxkDRuKrfnX8lCV4D130SRDD075g12DM9obeb8
	 pp98m70wnJpIQPUubnYavIvQe09HU5w8UpL58jm9z4Ag0fxz6E02R46tcF5hEMmaZb
	 A0HcNGsK6eT9gTbemr4MCnYO8GP0DQQwLAR0Hf/kmX+4YKk5LnR/9Oly4m88jjvtDe
	 RwrLSCYhkaZNA==
Date: Thu, 20 Nov 2025 10:44:16 +0000
From: Lee Jones <lee@kernel.org>
To: Daniel Mack <daniel.mack@holoplot.com>
Cc: linux-leds@vger.kernel.org, pavel@kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH v2 0/3] leds: is31f132xx: add support for is31fl3293
Message-ID: <20251120104416.GB1949330@google.com>
References: <20251114094640.4096054-1-daniel.mack@holoplot.com>
 <20251120104224.GA1949330@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120104224.GA1949330@google.com>

On Thu, 20 Nov 2025, Lee Jones wrote:

> On Fri, 14 Nov 2025, Daniel Mack wrote:
> 
> > From: Daniel Mack <daniel@zonque.org>
> > 
> > This is v2 of the series to support the is31fl3293 with the is31f132xx
> > driver.
> 
> Please place the changelog in the patch itself, under the "---" markers.
> 
> > It is now split into 3 parts and also addresses the removal of forward
> > declarations.
> 
> I still see the forward declarations.

Oh wait.  They are removed in a subsequent patch.

Breaking and repairing things in the same set is generally frowned upon.

Make the preliminary changes first, then you never need the prototypes.

-- 
Lee Jones [李琼斯]
