Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF28C26F476
	for <linux-leds@vger.kernel.org>; Sun,  2 Aug 2026 17:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785691914; cv=none; b=TiLbYVjd8uk2IIqH/kzwNBV/rJzVoyaZUMijKA2aTtzaKAr8PGuoA0Us3V2D6sDqJ4LJcysiYwyr98ntcZz9mhQEHVioEjA9Z4HM1Lf5cBBVd84zK0W67X/AE1WUgNhTK56JDWZwbF7HNdMj3dRZxgtRxo6q2mEd1bKbl5aDxFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785691914; c=relaxed/simple;
	bh=awxjziin2+ZixnOGK5qTOiJdl3jI+Y6SKNOLu+iBD2Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XFz2LLXOW8pCWF3osNzAWhwc93yUc5YH1nq4ufnUeQDlIQUee7DgqeAq2LvwYE/XmU9WcBW3udDtP3ywYjl+DkrBq2ZofLyIZKYysJis1CXbMet5p6sSaGWbZRjEGPYVnyim94tmzEX3si0Gl4KEhEEfQzPoXI3O8UqGSrdOJaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aI+QibZR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aI+QibZR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803691F00A3A;
	Sun,  2 Aug 2026 17:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785691913;
	bh=awxjziin2+ZixnOGK5qTOiJdl3jI+Y6SKNOLu+iBD2Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aI+QibZRkbFu0REUDgIKh/OWVcLv6Y29lJdO8c8qDCTP8xlHWmfITCyya9x5Dl3dS
	 LSb6RkgUl4n5YY/tDUCcOUBfMtOy+UrwFXjV1wVjoEAQ9T3SN3LRM4VoF6kM638dJd
	 lSOlJtaBMsWO2OnUiwryM5ckZVCGcP5RCUE7S9uhjUlBcsF2A0GtaXALn9AcZLkH7/
	 PVgB8bd7QHLpx3pzCb8zu4DPT1lBV4MJW1tJH6Ir0A+iCQvTL1vj5B64BQFQf4Iq0K
	 sc7PzmYO1daqioHcVe+5lMmJsdRuGDc88TubDsEBnZcE/197cj9x2MbsUQbw3+3ULA
	 /2K0UnRVgWTQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 11/12] platform/x86: ideapad-laptop: Serialize
 keyboard backlight notifications
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260802-leds-trigger-hw-changed-v4-11-f97e2ca976fe@rong.moe>
References: <20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe>
 <20260802-leds-trigger-hw-changed-v4-11-f97e2ca976fe@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 17:31:53 +0000
Message-Id: <20260802173153.803691F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> ACPI notifications are delivered in dedicated work contexts and may
> arrive simultaneously. In the following change, much work will be done
> while handling the notification, which could lead to potential race
> conditions.
>=20
> Introduce a new mutex to serialize keyboard backlight notifications to
> prevent potential race conditions.
>=20
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-leds-trigg=
er-hw-changed-v4-0-f97e2ca976fe@rong.moe?part=3D11

