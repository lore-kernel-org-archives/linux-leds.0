Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA92F521881
	for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 12:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068946; cv=none; b=FdBfORaChGvj9aBm+GIiRJTNwlv3+4/W2xV++KZW5FV7bxaQXDk6epocKb9i1faMYacWjXqSzMiWy4jGpwPjsWHZCBznauj8dtrifwoLytOYKdY7qjZVX0FVRT5BZELvUvAOmOwRZ4hLDbgTvCWZcCzPHFouBTqiEbxwe3+CEJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068946; c=relaxed/simple;
	bh=kDG4Uq1aMeQhhEKClfPtRKW14MWkUSOiJB7HsYKyamQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Q1uppHI/nkuW39uMp0Sf/I2aaNvfGEA8F+TGFm2jaIdrpnFepTqtQbHgCqarXMRPsYPyisdNFPDOvlHjxTyHlAb2ilUJitLSBCoeIE2XoVOT9GyPsGc8KbP3Jtwd+CCmjKAp/iQKIKrXRN8t+rwkbtmkrmlJnbetYJZ65LcTk1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fhCCqR94; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fhCCqR94"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C7A1F000C5;
	Thu, 15 Oct 2026 12:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792068945;
	bh=kDG4Uq1aMeQhhEKClfPtRKW14MWkUSOiJB7HsYKyamQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fhCCqR94wH6MRxfnAF84Hc68SL4Z7DHRwy+qw9yq+Pv6I7edCG0dMcZJK3+kywOV+
	 ZvRjNaTvmIv5I1ZxanEbu6tt2+E02MoNOdgsVeJnMyKNHwBxtBCXBGSp3ajmQgYfy6
	 jY+rv8Wp72Y+8jhkjWSRxwtr04ju4gwlzO30OGQoCF7XjqJEeQJHJabmg9Xrdq7Bsm
	 gxtAJz5PYETuQXfRkGFCPPjdLb5mV9qTL4m8PrG4roB2cnWiZWMPjc0fEFKQ8MCb83
	 AG9wyLPHeyXN4dog2kqpCYIRGNdvRqoACuRhhlsngTl4ekcP5+7skVrWnc6My65lQa
	 5R3yPCJmn6PLg==
Message-ID: <sashiko-outbox-172874@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: nic78bx: Use named initializers for
 acpi_device_id
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Zalewski" <pzalewski@thegoodpenguin.co.uk>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261015-acpi-leds-v1-1-81ac99b105e7@thegoodpenguin.co.uk>
References: <20261015-acpi-leds-v1-1-81ac99b105e7@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 12:55:44 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base.
>=20
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-acpi-leds-=
v1-1-81ac99b105e7@thegoodpenguin.co.uk?part=3D1

