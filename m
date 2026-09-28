Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF6E34E74D;
	Mon, 28 Sep 2026 09:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588985; cv=none; b=dxwl675b4AbZIFibAA+RK5rXRfc6ry+uFH8CHM+JoOPquhTZ798G7wA6NYGnh+A3eurJtPC1Yynt+7DVdyZ2ASroYYwHR0lTqfPeKrXovDXO63h8nbyPvxkRd2eoJFXuIexhRappQ7Dsu6kWGKhVk77wCIQhTdBn1kups46ib8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588985; c=relaxed/simple;
	bh=5IQLh7GrfdyGjeRpDxBdw3Y0ugM9zA2ASqxFOZTcmE4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TiUmKoWEJuX1Veg5Mvbvuxt5Fe5fnfebLE/qh3OPR63iB4sHQkQ7eWQiRddqtiLd+za62Fny6kpeGdb2O5CmtUELP+jsk3Cy0KlRcFZo0M/PPKycbaq58uUVaRWsd6J1obUKnYjtw7CuosghtHsv1dMVE4BoTmFOR3zvLbdZmKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XvXDkw0i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XvXDkw0i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126831F000FF;
	Mon, 28 Sep 2026 09:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790588984;
	bh=5IQLh7GrfdyGjeRpDxBdw3Y0ugM9zA2ASqxFOZTcmE4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XvXDkw0iOvqK4/b63WcY9vYtZL/uoFEWNkvTXu4D5CogVc1Zfc3kRdu1bSLSTg4OH
	 n9nN67vp5qGReajcqzPiOSMumM19UPJ0oWuLBZW+ULa/UI3iDSmq9oHrVbqGWnyUCr
	 +LHge41JEAXefWB1sdu+6CVsUJoTThwkv933JWQ2qzJg1W5D/tRHRF+71O3t9GkoVt
	 CcnS51+8kw44esqjoFs2WAABCvcterIVAR59NHf+PyJCnEHDDeFHiKpiCDB1cSa1WL
	 5J/DU/6fNcDcD+rkJX4SDhsoGWrSN/TJGXKqnP90NRopcAGZCX106v0+SpAmsefVlL
	 n41zCVMqfM9nQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] leds: flash: lm3643: Describe the LED on the
 Lenovo ThinkPad X9-15 Gen 1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rillian Grant" <rillian.grant@gmail.com>
Cc: lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260928094302.86966-5-rillian.grant@gmail.com>
References: <20260928094302.86966-1-rillian.grant@gmail.com>
 <20260928094302.86966-5-rillian.grant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 09:49:43 +0000
Message-Id: <20260928094944.126831F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The ThinkPad X9-15 Gen 1 enumerates the LM3643 through ACPI (HID
> TXNW3643) without a _DSD, like the X1 Carbon Gen 14. It drives the
> Windows Hello IR flood illuminator with both current sources feeding a
> single LED.
>=20
> The flash limits were obtained from an ETW trace of the SPB class
> extension during a Windows Hello unlock. The Windows driver programs
> 304 mA per current source (code 0x19 with the LED2 override set) and a
> 400 ms flash timeout.
>=20
> There is no vendor value for the torch limit, so use the same
> conservative limit as the X1 Carbon Gen 14.
>=20
> Rename the X1 Carbon Gen 14 nodes after the machine now that the table
> has a second entry. Sources and root node remain shared.
>=20
> Signed-off-by: Rillian Grant <rillian.grant@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928094302.8696=
6-1-rillian.grant@gmail.com?part=3D4

