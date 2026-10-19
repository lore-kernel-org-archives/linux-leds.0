Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F594A2A56;
	Mon, 19 Oct 2026 10:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404751; cv=none; b=lmw+BnHqJHwDSqNRwkpt+J+MdqVvwogoWifb1Own5B0Df9r1YLzCc3y1lPtbgZzmBvuH92c7RZgclPOlTWdfz8m9zeQ6MUjupyMvGbnJF25T/sDpZI9CTNPLgoV1AO26XbL9jhnuaae8NzqQ9Bxltf6bWgkSIsX8CI4wEij05Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404751; c=relaxed/simple;
	bh=K1TNRz3YmcairHAaNp7TruR6RgQVAZMBea9UKymyhMY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ocqqmVtzsE3bOKyTvdbn61LQoBJoOOwqK0AUOToimCODZS4egw/jiMz3mSYY5D2Kyg/ms8RmY/YoD/2t+Xd57DF5QWLnmBRG26DohNU11E7SDhbxyrnyYzGW6fQHttlpkZN3SH+yehgg1BeUQzZ9EvUn6bosKgyfbKJUPD5MkaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URHtqCif; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URHtqCif"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794C31F000C4;
	Mon, 19 Oct 2026 10:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792404749;
	bh=K1TNRz3YmcairHAaNp7TruR6RgQVAZMBea9UKymyhMY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=URHtqCif6/NrJMIIWHz2AjF/IeZydbm+r20bH3An8nUUGbJQg3W4BnuXj36do6DTg
	 fdgz4K8RjTId/79IeFwuhM3GRXpkBjf3c2TMSgHmuqFJzL7cagIo7q7frhlM4HohFP
	 mDO3qa9ywFiReTpzOln31V4wV6/XyX/40/yaLdDSUFACf8DTqb+VVmjpz5uVHyphIH
	 ypQQzbT8GULlRb5BUmiXcfp5rdQ8k9cOUO41ZUC92XBMa+sylMNhbgGfBy0ZFNIkrN
	 VGrsXh1Kyx/CKT5oOtl46SsH61+c+8/ZYhetuwlnJZfIu5WI7mdcLgrUJhOsbP9Pc6
	 1+QNMl6c8RkaQ==
Message-ID: <sashiko-outbox-176963@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] mfd: aat2870: Derive brightness steps from max
 current
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261019100930.110954-3-clamor95@gmail.com>
References: <20261019100930.110954-1-clamor95@gmail.com>
 <20261019100930.110954-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 10:12:29 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The AAT2870 allows only 32 steps of brightness, with this amount defined
> by the maximum supported current. Remove the need for max_brightness by
> calculating the allowed number of steps from the maximum current.
>=20
> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019100930.1109=
54-1-clamor95@gmail.com?part=3D2

