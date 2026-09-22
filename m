Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF465448A9;
	Tue, 22 Sep 2026 12:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081339; cv=none; b=uWHsE/DP7NBqTp/nKQ6qvTfDllz0E2orWMg8xhGtBVh5i2jwZZPWpiQ48/4C1ZKcVVdmiR9qpaFirUzk/7k6aFW/1tTnX1/RkkMwCR9M0MGoIKjIThuANmk5+SlW/AblGQMEtAxz6PaUsgSCA9/U/p2Kcg5dcixWapJD9+/QuZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081339; c=relaxed/simple;
	bh=Xs3QJe6AvSQ5xFSMnybhKuhHTPuy85RZzZK/vNwSMCk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ItuX5XAJHW7ZhEo+ZmjLYWlqc7HDOjSTSZg/vK7C/QFpzC/YPPIl+2MGtySa4KgFKmYTkHKbteaYLTyozUDIjAFFnEUMtsDsad+OAos3VuD7veoNqTtAT7dh3QXVttrFjTxN3mp7w3ITGH5idBWTPOPR7Rw+qgZX73X7TTLLi+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tg8LO1ZN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tg8LO1ZN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA771F000FF;
	Tue, 22 Sep 2026 12:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790081338;
	bh=8HMXROPoH1MYGiWp6U4SQQZJHZlI8uIZzwm5UnKfRqc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Tg8LO1ZNrFa8PlBvoDA+AjPyHUyX7pDlWorWSoXl22KMliKzPTV1U/ymxSCf+9ZaD
	 XcmorF2xgMUSqYp0uBRwSHbbWDQ9UNUheS9qHEWqNReHJO3cJCdk8pA1m+5J/foevz
	 2kVsE6f2c2WhWGcH2Zi+Hfnh9LWE6iH9mfTwt9f2jgIwiZ/4x01HIKy7t3OnkwvYOM
	 Aq7Es5tHjAiWlRPQmU7WSl7HlJAdtA5dfaQS3nTVycRnz+a2bxYWSe32FJv36MWXBi
	 KgAK/aBU3lG8fptJxppKM3wwtUaulqv+kM/msIvtjpmKYb8bFcgaC1VykOLfm9hmTl
	 GAdBtfaEmChqQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Cong Nguyen <congnt264@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260915034515.4147981-1-congnt264@gmail.com>
References: <20260915034515.4147981-1-congnt264@gmail.com>
Subject: Re: (subset) [PATCH] leds: lm3692x: fix regulator/gpio leak and
 wrong enabled state on last write failure
Message-Id: <179008133700.3371251.10815954067400483074.b4-ty@b4>
Date: Tue, 22 Sep 2026 13:48:57 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Tue, 15 Sep 2026 10:45:15 +0700, Cong Nguyen wrote:
> Every write in lm3692x_leds_enable() checks its return and jumps to
> out: on failure -- except the last one, which falls through and sets
> led->enabled = true regardless of whether it actually succeeded. Leaks
> the regulator on a failing probe, and short-circuits later
> brightness_set() calls without retrying.
> 
> Route it through out: like every other write here, and only set
> enabled = true once it succeeds.
> 
> [...]

Applied, thanks!

[1/1] leds: lm3692x: fix regulator/gpio leak and wrong enabled state on last write failure
      commit: 145ca6bca2cc5fd8d9c7af216df58a9c75c0e84c

--
Lee Jones [李琼斯]

