Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793504330;
	b=WGwYPStFrYRgy88kT52YwbqFnJBA/MYqTwV+CPG06DoyVTEidkzuhwuHKYFfLCKJViZP
	 P9eHyvtGkEYX72R2AQi9TCCjqf+qcQtMtMbutkpZXPQHBVvzoLgaKg32RiNss+gYI+ESJ
	 iNfAE/7YA7uN1Tcf5Q8zGdpK/NpbPI63vybWkbPK9AQChBrBIjT4wZsTmVnCdYBRVe0Nw
	 atEeg98DUAKG027w70REznpCr84dfCodfpjigo8UcY2KFgOFNWncUAPw7rno8BdgQ4apz
	 MbpC9kQprSdHOYfaCuXHNI5WSpOV/dLS/dTpfVaetl+WiwRB9JEcB+rJPiStBgXAeVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793504330;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SFouhvkCyb/7NyUJcaLQhnXzc8fAaD0MyMGBM6mKhs8=;
	b=2RO5aLhGcBoUXULu7rSlhMXXEXDP1Nk4njqUXA66xWRyLtI+G8anVMBOaPiPaEfKSALM
	 RqO/Eugf+koiRzDlXjMaq9IE38k2EAqTYa/O8nFczTO5zuejzCivhughy9lpvyyEnWFoR
	 FQd2UW1JmNBKkNsIbfD44ERf6LEtnwd1blkI8nrDW2z0WWBt7gesTzftOG+qK3U5JwKBs
	 xPQOA2UX0Z+z9NyYDsMEaDuLN7Zsvz9SiTh7A4gVTOiqrF2I6Z3bC9Uxwh3fXjl9we8aR
	 6QNufMMsAN1I853Km7Elhz9pb73zutFLGdW6P+4tU+wO3fNFwWnzC8tZxV/hZEE0NFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HGoOZbGo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBF9606A324
	for <linux-leds@vger.kernel.org>; Sun,  1 Nov 2026 03:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HGoOZbGo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F711F000C1;
	Sun,  1 Nov 2026 03:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793504330;
	bh=SFouhvkCyb/7NyUJcaLQhnXzc8fAaD0MyMGBM6mKhs8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HGoOZbGonEaACEbDGAZ6RtSI6il7qQMPSpCOeW+OV3lNVpGtJydhMhtEUC9fh0LtB
	 CxUxJlNUIETJuJWQSUi2VVSc+mrPlnJPZHv19cAwKu394nfxKOwrSNs/7NQAU/Y411
	 Svozd0ZNDcFf9pA022Up8m7cGh9n2F6p/jAR2H7yEBI+npNsuduHrnJvSJLsU/XSon
	 dlUPHA2LU9iJAMBWnJMmyFqOqKVYW2Gkj2Qx5y+F2qnLBXb7dI/zUm54q7Gx+03WHr
	 CT6bU6BovwR7CAfQ82mvYb2CRhYOB98SmvbT8oD4Qw4ssS+agZdBjzJeBhetT21d1f
	 g8DnzNuBQ4DLg==
Message-ID: <sashiko-outbox-192264@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: class-flash: use sysfs_emit() instead of
 sprintf()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshat Rawat" <akshatrawat095@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261101033427.442-1-akshatrawat095@gmail.com>
References: <20261101033427.442-1-akshatrawat095@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 03:38:49 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Use sysfs_emit() instead of sprintf() in sysfs show callbacks
> (flash_brightness_show, max_flash_brightness_show, flash_strobe_show,
> flash_timeout_show, and max_flash_timeout_show) to conform to the
> recommended sysfs attribute formatting guidelines in
> Documentation/filesystems/sysfs.rst.
>=20
> Signed-off-by: Akshat Rawat <akshatrawat095@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101033427.442-=
1-akshatrawat095@gmail.com?part=3D1

