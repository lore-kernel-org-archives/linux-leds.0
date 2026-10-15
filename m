Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1D2471D03;
	Thu, 15 Oct 2026 15:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079560; cv=none; b=pY0XB1qn0QKQC1aGIPNS8Ins2wOApbQvjb69OnJtZ5YAA9La1csTzbL0CyHEF1NF6LH9hSej1KfW7P7NXjc1bF302O5IKMII37+20Tr72ZTgAMMfQbC1ZLWhGea0umkUnUh1nM9j51+OrqwHaGqvdM40U7NaM6+PHBrURNOMLjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079560; c=relaxed/simple;
	bh=k+0GtXD3Qs53mfSE/fEkdu9Mf+jMTguHNnm43La+XTI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mTrriWdYTVtaXjwaZVhmVBFnUcDiQu4VZFIvUP73HUKUPTb32gHa9VQynGqsbxT7oWMJOoKlwrq3tNzYFuSJFdkV3amer8UQWu1EDWjzFuvw+KNf4kqQvFkHrWfB+IrXUv41bvb8eKJuJSr5STC0/ajRlse400AZvqragWm3AUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCxEQQ5P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCxEQQ5P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C30B1F000C4;
	Thu, 15 Oct 2026 15:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792079547;
	bh=Wu9kO84nVOZVbnuX/loC+MAVxoMwjysFTsSZyRRbJR8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TCxEQQ5PadjdABDBlTaOCCzeOEVKv/ljFIDacSEamn5jNzM0MpS1hiSfRw/Or81Bh
	 93hDpA0uSFZPTJO4ghd6ajQhmg55tbpvNf2FRl+uc7UA64XZitnwDTDhBUozc3Vzuc
	 3xEDnlyjQz/phuYYbX1sTJECNmYD78OzyBV3l+62qTf7kc3XTSHZaUaLN4ZZuMgq+9
	 JxqJBs4dXnty3oMiepogcYQYBM25CLa45Czv58XZIGSVMu1KpHWl5TOdzeib8IVwhX
	 M3CNYcNZZWFImoKJYfrWfBSAevo3SvX2Nwb3LGUteCpkFQ2GyYadIQ9j+23mkeg261
	 bOM+unZi8vNgw==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261005200906.188636-1-rosenp@gmail.com>
References: <20261005200906.188636-1-rosenp@gmail.com>
Subject: Re: (subset) [PATCH v2] leds: pca955x: drop platform data and
 allocate LEDs with the device
Message-Id: <179207954632.2076145.12145810998476097553.b4-ty@b4>
Date: Thu, 15 Oct 2026 16:52:26 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 05 Oct 2026 13:09:06 -0700, Rosen Penev wrote:
> struct pca955x_platform_data has been private to this driver since
> commit ed1f4b9676a8 ("leds: pca955x: add device tree support"), so
> nothing can pass it in through dev_get_platdata() and it only serves
> as an intermediate copy of the per-LED type, default state and fwnode.
> That copy is a full array of struct pca955x_led, the same runtime
> structure that struct pca955x already holds, so the data is stored
> twice.
> 
> [...]

Applied, thanks!

[1/1] leds: pca955x: drop platform data and allocate LEDs with the device
      commit: 7260db6364a2999f2f85bae8afb6b4d22e41fc8a

--
Lee Jones [李琼斯]

