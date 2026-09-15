Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB0E3B27C9;
	Tue, 15 Sep 2026 14:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482151; cv=none; b=SOM6NPibLm3RR+BPJroEELaYnsfm/iRDAFfIz9TXAnP1Fq1tGMpiD75+WZbOPrny5/3ZbyTGE43kM75ItLAP6/9hhTF+D23B8BUQiPsYB9LQQw+GocNHrMA7naQc2rbGyLfPg2VizBX9tucC3IFhgYUOMEUXq8Wos/bI7zQtm0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482151; c=relaxed/simple;
	bh=m/Fj+93wzWGPtKKEEzO+KtzTnE/sjnhkPLrKX+HHPMk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e+zQz67dlVlgd0b7WDH3rN2lUwgSQ6WBRaRnXm+MvAwZeWqVSqPLXxIUUA1YBbvQBQdc2fKBj/W54YXLgFGtTwgH4DFM2JgINslS0hV6Pb52Tca6ST6DMlCWmg6zu9ZmGsAxTNqhryvhet445drJ5U/qsmHYzGCUgEJ6196XHjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UM1hm8N+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UM1hm8N+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A921F00893;
	Tue, 15 Sep 2026 14:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789482149;
	bh=m/Fj+93wzWGPtKKEEzO+KtzTnE/sjnhkPLrKX+HHPMk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UM1hm8N+YNeYZWuOcoqM8mJub8HSsG1DMKxaGUz+YHcYwm1tDRhrHxsWQFvy62Ib0
	 +4MpjVrtno0NexfDKwfb4F/AlJjAoCJHjl97maTaMfIdtrVh+rqgUYj9h8NUWvKP25
	 sNqnljPIHOurcRyYvwKbkyyt4+bXrT3CWnm8yxn16MjDTZaDsMCR1wozlwv0zUrGga
	 PYUdHXqQeZVHHIYy8zXf+VIBTO/NXt13AUQ5KC3fBDyZu8oyBAXjXuIqDjtHFvERwM
	 M58IwWaps8ctxItYhgcmPb3fuFu9fPj3at5rCu5jPIklR9ALztkZSJBp0FIr6ESHsT
	 nEnVtPqLJGeCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/8] dt-bindings: leds: pca995x: Describe
 nxp,output-gain property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <0eb2e22d54062bf4d6e50e18a27063529510b9ce.1789477502.git.nora.schiffer@ew.tq-group.com>
References: <bd687915af26ccdbfc8cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com>
 <0eb2e22d54062bf4d6e50e18a27063529510b9ce.1789477502.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 14:22:28 +0000
Message-Id: <20260915142229.57A921F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Allow configuring the output current to adjust for different hardware
> designs.
>=20
> The output gain relates the output current with an external resistor
> connected to the LED driver. It does not directly correspond to a
> meaningful physical unit of measurement, so we refer to the datasheet
> for information on its calculation.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/bd687915af26ccdbfc8=
cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com?part=3D2

