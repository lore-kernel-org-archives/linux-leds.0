Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AE93B47F4;
	Tue, 15 Sep 2026 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482387; cv=none; b=Vs9fJ7u5z6n8bKCgOGQ1BOGESFkaPi5SsiWyLYRAaAU1JXVmuvAeEuLhQukowoLMJDOGIoV0XNSSTsLt4bvn1lI1uHX16M21t6aVXCOq0aKn1WoRkf11umRoKTAgB2epn0lRZSipVz6Kendil/0KLsjrbytgwr6ninlTkOBY9OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482387; c=relaxed/simple;
	bh=rPmDld2jmo7bJKxls9qy0htl9d02dKpBR/9dbhtS3kM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LjB+CQFHpG9gwsQxqVOpU2O6spz/3AN9JdHxWVAurYmjYdc1bs0xaVMdv5FCvRJ8Z0QHSpUHtDKiWxvuCUuv04/o05G/BTVvY8eqtge84nMmAjy8xcZL8Z5HW/UcSArk5MJ5MCV6SWl1VLmtGKqoiMw8uJN0fmCVdS428+UOk+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B49EzZ0y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B49EzZ0y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0B31F000FF;
	Tue, 15 Sep 2026 14:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789482385;
	bh=rPmDld2jmo7bJKxls9qy0htl9d02dKpBR/9dbhtS3kM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B49EzZ0y+UqUwzvRQ+JkIuDx9qXrsZbDj3djem4LSA3aX+BAqX4teulgb3w8qkClj
	 /EUFOA8hvQwqLXLfzFySJdeIMwajZDDwPqroHuwjn+DUmvNzFGwwxhf6InTLEy83WU
	 UE+HDRZBxZE+TqSPUWgaVbdDeXOOl8OBZRAu5M6V6Yis3MjzE3bJcrJ6M5odzs9BG6
	 eeABlZ3k9iUI33/ar2dRO7vCR/N0WTzSBcRYLjpNpCPsdJnT8DW5hNaKHEEDgCaPgf
	 YC+tstUGC0PGKMa22NAlZtu2SVUn07dz1LIadv97O+5eMjwurfx/TaaE+GdWGE3tOj
	 FUOqezc2HL1qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/8] leds: pca995x: Do not use full on LED mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <9f44869a2f046f5c5784a8bc9b3e7769436ebdf0.1789477502.git.nora.schiffer@ew.tq-group.com>
References: <bd687915af26ccdbfc8cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com>
 <9f44869a2f046f5c5784a8bc9b3e7769436ebdf0.1789477502.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 14:26:24 +0000
Message-Id: <20260915142624.CC0B31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> LEDs in full on mode are unaffected by group dimming. Avoid using it,
> so group dimming is applied consistently.
>=20
> This slightly changes the brightness at maximum (from 100% to 255/256
> duty cycle), which should be imperceptible; arguably it is also more
> consistent with the other brightness levels, as it will now scale
> linearly from 0/256 to 255/256 over the whole range.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/bd687915af26ccdbfc8=
cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com?part=3D7

