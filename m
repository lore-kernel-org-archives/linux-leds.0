Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF8047ACE3;
	Mon,  5 Oct 2026 14:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210364; cv=none; b=GmBTUlgz/uEmVNa2awpo+PqZqAHgPGUrUprwYoFWV6W4gHdKqoLCLRdlrBtYje7PcycTEUa6W2H4fvXLspHpIQ5vt5dUqK6eeLhVrn5aUGNedUu9eOcA6mg8X3CvVb+dOV+Eeb6Iq4mn5otUT3ESSyRmK5K9wm+muPHl7fd6pI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210364; c=relaxed/simple;
	bh=0/7Qv8qiYqUfDVP9WRxkfF9IMscDdwyHK9ZRhIrqCnw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tPdcvIE3m4hsiQErDS/zhsZUcESCH1iOofDZZGm2OkTTeXjvsJqIqNMV7AI9xahF0MYJ5KWe/GVU9pQrfc3H5LcfZ1YJJaoxb6dI+cC2A4YPRhPo23qbgsgJmcca9xvOMqPVjxAA6+sMEGe6+kw+yBLxSJY1GhzBsD+gRWy58BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TlbYUYd9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TlbYUYd9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FEB61F000FF;
	Mon,  5 Oct 2026 14:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791210355;
	bh=0/7Qv8qiYqUfDVP9WRxkfF9IMscDdwyHK9ZRhIrqCnw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TlbYUYd9GwC2EHTuRG+19KuHgKpQL++fw4O6wKQB9dn+tVErXABRKIgrRdKX9uoFE
	 9bR0nJtKrC1CuZtEgVYo+SrncTENQF3wsds6lUuHrRV52vEa6L4OZbjR7hn6WqRcqW
	 /gGA60isv38c6bAICKCBkAIAbHw1R+HrOkVb68XK8yJkc0PBZBF5pf14WhYu0bCbz8
	 /3g13atUwwu/24FoOawSIclWjU2i1rTYNoo2Dx+46jcIul8xZKmK4VjEJUcAoZvfUk
	 0LyCSucsiRegcFd0I1/EsQYPPVuHGByRO5dE4FNjVTNmbOhxubLp9eljNtolbu2xEc
	 s+ePVdTZrplkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/11] leds: pca995x: Add support for reset GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <fd45facac5cdf1930f2ca1666a66cd06cd1f659c.1791207391.git.nora.schiffer@ew.tq-group.com>
References: <cover.1791207391.git.nora.schiffer@ew.tq-group.com>
 <fd45facac5cdf1930f2ca1666a66cd06cd1f659c.1791207391.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 14:25:54 +0000
Message-Id: <20261005142555.3FEB61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The PCA9952/9955B/9956B have a reset pin. Use it to reset the LED driver
> if provided in the Device Tree.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791207391.gi=
t.nora.schiffer@ew.tq-group.com?part=3D6

