Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5889B456DE2;
	Thu,  6 Aug 2026 14:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786025992; cv=none; b=P9fcPTgzk+70GucFhSosVn7cMq1zkMUMqLQEsAIYa2P2VRXbobFVUSumwqNe4kTcQSIPdsvDptr3kB4fdTrT3dR6kdtlvuKeM/4hW1gHkXV+wPyT3mV5eqyNM65RDVkf/iGlZcGqWZozDvQylVXvrTBCJ/JO9LluS0LVl8ZBpzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786025992; c=relaxed/simple;
	bh=NfzBtcKHDePXJgc9PAiIM2NKOlppup9jNJI1LgL2qeo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qgcLZ8wZY8XggHhcppIoCyyNq08DGe+yxxVGuXg/1FnHHXuEQMeU3r9rwh0+JSOm6FtkH/KHDGLJQuIWT61a/ZcwZpPqQ4pCaJmPNNUv14kD/smZfJajsvKHPomcW6SB3iN9BJfx8gSQktEPZV9fhyC0Og1RL0Ow0Eqho5ARg0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLEVXsDj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLEVXsDj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7FF41F000E9;
	Thu,  6 Aug 2026 14:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786025989;
	bh=OcfElYfDhzAI+6nLLJf6y9YcQGTqePcv6ftw5MuBZx8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XLEVXsDj4OVy6VanD609MEfdHSmbAm3xCrVM1A4QtofdOUY9O3yvJOakqzFOqTxSC
	 pd5iRyNPmEVGSNCS87DkhyT5KjFi/m5xMDRsAUR4liDClsPXhv8AzzgnMllSpvRDCX
	 JXBUwN9eOxqLnBxItF7RA4AvXRW66J8CgrKCAMoCBXM9emeFM5sMFFwavbxh0Xt4Ia
	 yap6sWVMiBuovnYU3jUHRUfFV2bd8+NCxflDaCYwd91z0Hv94IvTgKJZ+m8jA9veXU
	 ahWfmR4d9ADD78Mcfm7Q+SVR+hz/gYDoFDW6yG0OepqxTZUcplUsx6jKzZ36DlG3cJ
	 jpRxdfAjcfrcQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, simon.guinot@sequanux.org, 
 Ninad Naik <ninadnaik07@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, me@brighamcampbell.com, 
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260728183945.12008-1-ninadnaik07@gmail.com>
References: <20260728183945.12008-1-ninadnaik07@gmail.com>
Subject: Re: (subset) [PATCH v4] dt-bindings: leds: lacie,ns2-leds: Convert
 to DT schema
Message-Id: <178602598657.2950041.10846085536378825135.b4-ty@b4>
Date: Thu, 06 Aug 2026 15:19:46 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 29 Jul 2026 00:09:45 +0530, Ninad Naik wrote:
> Convert lacie,ns2-leds to DT schema.

Applied, thanks!

[1/1] dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
      commit: e36f8825616b73a09cd2308f2644aa12d7fb6db0

--
Lee Jones [李琼斯]

