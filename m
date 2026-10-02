Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE5047532A
	for <linux-leds@vger.kernel.org>; Fri,  2 Oct 2026 10:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935642; cv=none; b=QZzXIOuVpnu4yA4W/6jaRyq/P0qIumvTHhbcPQ+3bpkj/F8at61lDcF19Hx7fUq9BrHFHM+x7XCXCiDVizDmtySHnTiI2bQZe8tnAWYBUnoOSXNTRZE9qVWtidkcsf+u0KdBK4oUH7qALtDxadIaF29lNAU5SOQOcJ6F9ESz6sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935642; c=relaxed/simple;
	bh=GAco17uuZe1n/RWVeem+znJWw9S7yzCKu/j0aBi0eL8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J9VXiEccVkTxL6JwgcT0KvMvwzPqbWWwKvc8ysLCXW1i4b8cQ3+Gnw0MRsA2YQhs08Wd0gPQU2etH+1Uyd4WjvoIPz992ihoU0iP2GGlbuo6JZwhuxdepIkFaK+2L9pyoEqJl66xg6HtiY0DQeNf7OQKjId26mGc9+542/UddX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bes+7SsO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bes+7SsO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA361F000FF;
	Fri,  2 Oct 2026 10:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790935641;
	bh=Jdom1eLR67XpbpvdFyPcFoaiHhfM4QSj78PEiaNnBdY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Bes+7SsO1NOHPgJJi3N9C9Hf/90LH2fMZRoV5aL7Gp01VLE/sf8X/mQoU/bmPXPAh
	 Qwbkw3awbK1+o27pyw61ZSS7B1p0962cqPf45cvJviMUbmUi4VW+5ENEM7Bw9TP9M3
	 tSemIY08eyjRHYBncq7I5MKpucwpRkvo/TKWm1/H/5ZRil1KAk78qk5GeGZmbtRDrI
	 N6q1/jky/thptnwvPZ8EL3fHBMnWrJeGegHF6iU2Pmn0OfP8j7ZnaHpT3U+nIDawGM
	 5tB1mbjz4apcAiba7Kb0NQu839/Ds8lHB5M5Ewym2Hd6TSgzxH82+Zu721IsRQysGS
	 vFuOL1LhYqj7A==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: linux-leds@vger.kernel.org
In-Reply-To: <20260930-led-add-maintainers-v1-1-ebd45f8b6ab1@kroah.com>
References: <20260930-led-add-maintainers-v1-1-ebd45f8b6ab1@kroah.com>
Subject: Re: (subset) [PATCH] MAINTAINERS: Add myself as a LED SUBSYSTEM
 reviewer
Message-Id: <179093564054.187150.10863204413296759536.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:07:20 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 30 Sep 2026 17:20:26 +0200, Griffin Kroah-Hartman wrote:
> I will be helping to review LED patches.

Applied, thanks!

[1/1] MAINTAINERS: Add myself as a LED SUBSYSTEM reviewer
      commit: 755fd606097e7b225a9192e9227bfc3a6bb3643e

--
Lee Jones [李琼斯]

