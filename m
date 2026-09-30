Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E5735C68C;
	Wed, 30 Sep 2026 15:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782872; cv=none; b=COSbfXS3fGYOR0HMVtU4pfIq01H187cVu8pZYWkrH2APXr03F+6DVQ3UkRoRhwfC4jLYmiStWQRWXu3+AwQ2SK8nuKmETLk7ApDYukhpV6jF5DdEgyKOzebolDurpUg5tYf8uGGdx14EhFm11sqamtTxQDZGrsEEigWU3W4CRWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782872; c=relaxed/simple;
	bh=5Fc4SehVhleQ3CC5cxk7Ifvfc2uDJcEIzOcTEaU/4Jg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AH2czuFYZNY2FwVCcOfSVQ9nvZcmRGPMipMieqFl6oaqSnVh7IrqvCwUUdLnshlOtEQCVV16xpRHCayyBLsf+Q6PvnhFqNoj74wPC9FF2uSQNx2Aod07Uqzyb/KhFogCHJBk8ZGrjRIBIrX35NRLxy/2TJg1IK1s2Q9Z2FMVXO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lk0ufaEG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lk0ufaEG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A711F00899;
	Wed, 30 Sep 2026 15:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790782865;
	bh=5Fc4SehVhleQ3CC5cxk7Ifvfc2uDJcEIzOcTEaU/4Jg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lk0ufaEGWZA0v9kKydDEdmip6Whv1Y5YpX+WipNFsrUi+KMl2FnpOyq7W9CF2i8vf
	 e62Zf9lfGQvoUY/0WCj6g/Ihy8y1rCV6eOujNOPhLhpgHsWVx4GRSxfRr1PDZNM4Ms
	 jryzew9zewZ1o1Y2C3qDQSw3mBlzVkZYReTILwgd10rVOi3po9Ve7NQxjUw4QGlYmL
	 BIKuKpWnqBT2QZx9+NIIgbiMHz2RsXuAefbTnLUeqIz6Rxwz+GP+u6iHIfg0cfzS5m
	 u/jprKbW3DzvVT+jpNr/vvX2xkNnXM+k+GIOHahj2NsyGoEuzw7L4Uu2m7DL4MNJXT
	 rIQj+zqQEaWCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/10] leds: pca995x: Make output gain configurable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: conor+dt@kernel.org, robh@kernel.org, lee@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <f1ff88185074948a40a1e8e6f022cae4fcc55fc1.1790684839.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790684839.git.nora.schiffer@ew.tq-group.com>
 <f1ff88185074948a40a1e8e6f022cae4fcc55fc1.1790684839.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 15:41:04 +0000
Message-Id: <20260930154104.D0A711F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The output gain linearly configures the LED current in 255 levels; the
> absolute current depends on both the gain value and the R_ext resistor
> connected to the LED driver. Make the gain configurable in the Device
> Tree instead of hardcoding it to 128, allowing to adjust the current
> for different hardware designs.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790684839.gi=
t.nora.schiffer@ew.tq-group.com?part=3D7

