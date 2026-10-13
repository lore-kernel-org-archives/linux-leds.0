Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2314C442B06;
	Tue, 13 Oct 2026 14:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902013; cv=none; b=VKV1838nhTjzHsiJm7Saeqk55OSdOaJPHfWuPn/iXSwTx0gjCzXDCiUJKkK3I9NyP+AYqGicUcN/nOCtDPKRoKRmi5AinaBbtSKsiTjwwrcghYeF1p6LqVs+cm7Fae1Kz+DXoCBfkzNx5U5IX5CnujqJ4vO0oeQ6+l8mt+iKuC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902013; c=relaxed/simple;
	bh=Zo10NXRqx5D37pf0J1b9IQrJCHhglnI5U4jRS2cU+wo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IskpTkxYPrAmFFUNsxzXxWytCEwF/ClCk7YTzVbfB0wKoXRj4BUv3Q07rudDT4WOMyqfaBN+nBY60/k34Pi3x4pG5aE5VApMl96RuWMgnjhf/6sjMLt91FxVBnro0cCNbJb+3xmBzNjW3eV6CC5LNvdcIfBg32OjGdB2mTt0KRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTwrDwPs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTwrDwPs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74621F000FF;
	Tue, 13 Oct 2026 14:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791902011;
	bh=4ZdtDg0KoevCPpzkapooRr26wNz42E2qRM8yqhcMI9Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jTwrDwPsYaToknegM8NWiL133eg+9i71dQXUQb37u139VLfZp9zSPPX6M9aF8iKzx
	 lEH2u0nmRHB9nZNZhioOEQlg35+MldaXobwupjXvjv6gJ3Uh8sz902yobqqmFv0cBD
	 ND/hrKIc/7uYCVTTvTYzTOKFDYzFXpCC1/SuTyWkQmrm+DR3TMTnZKktwBM/WTXau2
	 udgULVgh+WuPuBADKNmUw9kesnD63fAQTnaD16XlzPK3Jy/jhsCAlsjytwIkwvWixE
	 15733hXHFziGnNAHm1v5BfjeiJZ2zwa/BRWSouysu08T/twTacXS6qNlfnDhKtQoox
	 cWj+e6vk9DXzA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260921232709.3133716-1-robh@kernel.org>
References: <20260921232709.3133716-1-robh@kernel.org>
Subject: Re: (subset) [PATCH] dt-bindings: leds: Allow PHY RX triggers
Message-Id: <179190200961.3967776.4408382849497202472.b4-ty@b4>
Date: Tue, 13 Oct 2026 15:33:29 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 21 Sep 2026 18:27:08 -0500, Rob Herring (Arm) wrote:
> The ZynqMP ZCU100 revC DTS uses separate phy0tx and phy0rx triggers for
> its WLAN activity LEDs. Allow the RX form alongside the existing TX
> form.

Applied, thanks!

[1/1] dt-bindings: leds: Allow PHY RX triggers
      commit: 1c93924893871c517e54fefc1feb420af3eadcfb

--
Lee Jones [李琼斯]

