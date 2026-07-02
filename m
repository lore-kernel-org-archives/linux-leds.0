Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B85353A6E;
	Thu,  2 Jul 2026 14:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783003961; cv=none; b=iR+dzwwu7evlcNvuaTljO0msTV760Q2Rgy2qGfa6scj5RGhborC0umc51qO9oOhJSkARSIBBOZVBfDKW7B/eqMsnEraOhKZlXv8b9ius30UsE584vILdwVQAXtyjJHaGTnWkugWWeBmGKEl/uN+PqBxe0jIiQBbUYq9YV7OrWNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783003961; c=relaxed/simple;
	bh=TEJ8hd2/Kj8GyfJVYLEeR5dtqLQ4Oivv5HStuKS/ZAE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ir+kTwFYLSUperBJuBnOhZz3qO6klr+kP9Wu272ASbdT6uC+ywbgACC/4cvgKQGuDWgvzdNEI/HSvfSoF5evrOflXie3Nd90RLuwi6WiImIqWbK2IkvnwIa+dbpSwd720eJWBIcv+5lJ0dS/jwlFo5tDtt3Aq3lfdNO0W9WNBAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NkG2+Qdd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NkG2+Qdd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8C91F000E9;
	Thu,  2 Jul 2026 14:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783003960;
	bh=F9ZiqgUMNO9OfRGt0gbxbnEcXpp2cS9MV+sJJKwVLzY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NkG2+QddcHWeAVqQnCwQEg+3w16uGSEcW1inghcCKlWanBwlOSr9ouBygXbx3cDER
	 nvQbaVWT9UksmTEN0JE++kBg/ymJQn8NZ4DBBJKk5DVd/5cX1S9LHmfT0BWxJq6X3W
	 Xc5tOZuxOXPYPMgt9Z4NQRblrfUMzPq97cfp1b+GOLyzBvO6spxfLD29R5HrcImlsL
	 wTsvkIRE1Ix8L033ZXwj9nP+F8LDYpRb3K4iQgmxadVvm1YW2QObVk6W/6a/FnJO0M
	 m/lP1hf0S3X9IJEZl3BH+CPi8qDHmGmbqwF+dZKN8wFRKQcqUzLTaojaNW1Fi7FdVk
	 omvBQTSVFJBwA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-leds@vger.kernel.org
In-Reply-To: <0f4d556e0532bfa881d7d83c1e244572117a89e3.1781970674.git.christophe.jaillet@wanadoo.fr>
References: <0f4d556e0532bfa881d7d83c1e244572117a89e3.1781970674.git.christophe.jaillet@wanadoo.fr>
Subject: Re: (subset) [PATCH] leds: lp5860: Fix a potential double-unlock
Message-Id: <178300395823.2187505.4713396365487978231.b4-ty@b4>
Date: Thu, 02 Jul 2026 15:52:38 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Sat, 20 Jun 2026 17:51:53 +0200, Christophe JAILLET wrote:
> In lp5860_device_init(), if lp5860_init_dt() fails, an already unlocked
> mutex is unlocked another time.
> 
> Slightly rework how the lock is taken/released to avoid this potential
> double unlock.
> 
> 
> [...]

Applied, thanks!

[1/1] leds: lp5860: Fix a potential double-unlock
      commit: 10a5a70c02277a1c12999b669a1bd1922558338a

--
Lee Jones [李琼斯]

