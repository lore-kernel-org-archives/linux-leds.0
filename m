Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9064A689D;
	Mon,  5 Oct 2026 14:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210425; cv=none; b=nqBhf3TR1mo7MeSqT9lJ6Itnj+Z7FJVoqLzUyg1M+dXLUJBrqKWQIMxzpd+ObjhHVqTVvhO0qbklnwO2x63QyONRpfQIcn6upNrLGVK5jgZOTE/8oPrIlZ3y+WQz7oaZgiCEAzhqLzqXFRSDeC8LWun+8M+mc3HVvsZ1tXIZj4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210425; c=relaxed/simple;
	bh=WFIiWRaDfUGisNMfSJhvRFbSX7gYMsuB3H0lxZrL+lY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XdJRyhzuBmomctYQ5UFqZT/bd4QtLT0t2OY8KDkSuCZYlCSSh2mRfnx7uQSXVmgSIMceXRINFWtlOOui6DU1axj9KmZtROXDlmZCBeExMzxRPcbh7ww0EJQOQXfmc/scyd4hVqk18sfUe7aJgcg6wjZsLx3ooPK1TLP+t5y40ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QRWxLZ+B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QRWxLZ+B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C46541F000FF;
	Mon,  5 Oct 2026 14:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791210416;
	bh=WFIiWRaDfUGisNMfSJhvRFbSX7gYMsuB3H0lxZrL+lY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QRWxLZ+B6UhOecDzwrbyZD3TlbPM7Ujr/LWCUB2hIqSpf1TQrCkhrgQNSeXNqVV9f
	 zbQYyO1oAjA+9qOgcB/um7CvgdtZtRXzIdpr9bYzHxJuGy/EniPN0XAVTwnplkmueW
	 4jMQVSDMEzFO8VptaYmUVWAdJF3Qo4TLrFvxPkjkoCJ67CFCBSELCvoxeSje5Ij04o
	 YtDMnYvcZbq9VKKRhYfb86YE/b/Nfwj+KkZZFatxMNxMDInAMkVxucK0yKM9Tqw871
	 DVbzMxxbde+BSAhcwnKT/W9tQQ1FZLu7ZNEFSLYVkVeU0ufCg+v/LKyEicrjx+PaXh
	 VpW9AHdFhHIyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/11] leds: pca995x: Add sysfs files for error
 reporting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <5ec0d621cc430d730e51845d4aafb1c2be166fbc.1791207391.git.nora.schiffer@ew.tq-group.com>
References: <cover.1791207391.git.nora.schiffer@ew.tq-group.com>
 <5ec0d621cc430d730e51845d4aafb1c2be166fbc.1791207391.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 14:26:55 +0000
Message-Id: <20261005142655.C46541F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The PCA9955B/PCA9956B have builtin failure detection. Provide sysfs files
> for individual LED status (reporting "okay", "short-circuit" or
> "open-circuit") as well as a global "has_errors" flag. has_errors is
> sticky and must be cleared by writing "clear" to the sysfs file.
>=20
> Failure detection on the PCA9952/PCA9955 (without "B") works differently
> and is currently unsupported.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791207391.gi=
t.nora.schiffer@ew.tq-group.com?part=3D9

