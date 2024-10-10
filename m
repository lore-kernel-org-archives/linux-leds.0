Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8911BC07D;
	Thu, 10 Oct 2024 08:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728549486; cv=none; b=Szny6XlU75u7hX2j3K49EB/HZvwAWaRICW2aWvUV5GSbBIO5xOthtHxZJERZRfLMgusiJY5kf4atSBuqjiBuoe8o1mu9HRJjdGfOcQNCs7AsUmMKtZIcXBDL4bS+miY921Nwp9l5Ju5pnmoHKqkfpXgzhCNgEq5MfevFTybGLn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728549486; c=relaxed/simple;
	bh=WqvmmgzD0aYk0ak5s87V8hVg6MFJR6c5woVvve3IbH8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZDilPhVhaHDxo6MCWei9YGC0CKRUJlQTuF4f9emkySKeTjrrCiSv6YBVqLvkzBafrNSWgrUKShVj+3Ms3JGiufTr/qsFRvk+83r2Y3KYlH4cuRTK1xudKLIU4jVhbfZe26uAcMKbdCSFNq3m2BDw2vC16FbZ9I1I9YnD/iLXwtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tMIU4uXI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tMIU4uXI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A8CC4CECE;
	Thu, 10 Oct 2024 08:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728549486;
	bh=WqvmmgzD0aYk0ak5s87V8hVg6MFJR6c5woVvve3IbH8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tMIU4uXI5xNvr1FzUC/1gxC2cEuyAm8chDbJebDeQwLUzqCfHOANlGBBa6JgM/E8y
	 wLBqtiRYMatByVnGreGysEvaGPceBvrD035eFDIyR+TLIAijSo5nGwP52x6/1mBA7V
	 Nbwu21EdZfd/i8DnsmYG4sWl9TqxZRi1oGGs4evxSCTMWSaiJYMrvIHubZlbRJWaoF
	 ZuwewAhrj8oxHNjQAcV/YUk0E1VB7UiZaq1EMJ5TS91IbAWblkH5XKcnZnAc6iTiSy
	 OQeTedwtSuFFE4RjFUsObx93nfcwgOyIRz+no1/8Yn+oGfc5swOMqMQOMagGjLZ0GT
	 U695AdybWjI0w==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241007205315.2477060-1-heiko@sntech.de>
References: <20241007205315.2477060-1-heiko@sntech.de>
Subject: Re: (subset) [PATCH v2] dt-bindings: leds: Document "rc-feedback"
 trigger
Message-Id: <172854948425.2396904.7760250563475803745.b4-ty@kernel.org>
Date: Thu, 10 Oct 2024 09:38:04 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 07 Oct 2024 22:53:15 +0200, Heiko Stuebner wrote:
> Document the "rc-feedback" trigger which is used to control LEDs by
> remote control device activity. This is an existing trigger used in
> existing DTs, document it so validation of those DTs would pass.
> 
> It was originally introduced into the Linux kernel in 2013 with
> commit 153a60bb0fac ("[media] rc: add feedback led trigger for rc keypresses")
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: leds: Document "rc-feedback" trigger
      commit: 267f1ad6fa0c45ba39d60c33949605820f791ae7

--
Lee Jones [李琼斯]

