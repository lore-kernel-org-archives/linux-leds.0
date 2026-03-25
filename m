Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A5A3DB642;
	Wed, 25 Mar 2026 14:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448209; cv=none; b=TIryzuRPfsH3uQnMetNcx07KPwL0YhaEoi9J2Zaib1Pe8GJD4atYle7qHo58a9k/LOFxMzCJih4EmBQQolsn54iwLZSA+fWG49xPNM9KS7QgxgrqwoXmmke5GegKoyPBO3AbxwGcMDtDQfGHAxySAuJG0wNkwKq0uPj5D2vb7OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448209; c=relaxed/simple;
	bh=19CEqX8oPDnlJt0THizujet/yCZ5SVpLk5Dh2CPvAtw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Q8wqMBnNBY1EhZvtYbNZOFBOtDusmHHy3Nj5tXxRXbmhkJBva4H8MpRoHkvbQqZolSgWuyyLNw2R+6Al2cf02rpjyO7pCRFAEncTuplnt0Zx8ee1Ngg1H/kQqlE28jS7v9VNEhWJAU4rrMYZm5zicSnx82k0OwmKVlSkt+8ZbPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H56xfmJC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H56xfmJC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DDCDC116C6;
	Wed, 25 Mar 2026 14:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774448209;
	bh=19CEqX8oPDnlJt0THizujet/yCZ5SVpLk5Dh2CPvAtw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=H56xfmJCo4dRGU2g52sJrf8BASoTQxcSyF4j8gM9nI/swrbuORRhdOsGDqSrKjKJJ
	 6lbyUER80io8j0pVB4MdL5GeIejiKdtZvLCprYgio2qTuY4elBzTEcGCeWuPX7chwQ
	 eiIBLtANYTe/BrPZvTJigwmVzTLAKUkqcYkXcF/YT6pbLg2sUbL7ByZuvxWImhNvic
	 lG15aIrLOy7VJJ0k9iP+beBPzZ7DU9JT7Dm2mq/aBQH8q2aB8IxonD+2t1vTWho9SV
	 /5FElBZ8QoKeOlgnS9b+pYguJZbYUaNR7CJN4RsTVsPEGhTVl7FQhvKn9coyl0eOht
	 ZgTENhOTHkHXA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, 
 Lukas Kraft <rebootrequired42@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260312210958.48467-1-rebootrequired42@gmail.com>
References: <20260312210958.48467-1-rebootrequired42@gmail.com>
Subject: Re: (subset) [PATCH] leds: lgm-sso: Fix typo in macro for src
 offset
Message-Id: <177444820780.1299095.2893727011051817345.b4-ty@b4>
Date: Wed, 25 Mar 2026 14:16:47 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Thu, 12 Mar 2026 22:09:52 +0100, Lukas Kraft wrote:
> Replace unused argument pinc with used argument pin.

Applied, thanks!

[1/1] leds: lgm-sso: Fix typo in macro for src offset
      commit: 0e2287999f0432b51a54c235db660789ca657f53

--
Lee Jones [李琼斯]

