Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8204611C6;
	Tue, 20 Jan 2026 16:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925500; cv=none; b=p9D7nI6PoUAz1aB1+rC554FSRFwk0RoerMI7/7tGI/QQx5tg7C72yIpp2/t6gLz+F+j1o3zUKJysvjHe8aH9XrwccbukbJ+2hRBFIS146bZGsrKAYaFWz4WHjBj/Kpe6fTs2QaalD6yyeXtq8DkcHnlED6qwh++/cBdrhJg5yKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925500; c=relaxed/simple;
	bh=2FdcTFUlXpxDIcJam3HB9XSvIJ6QLNxj/aGtOw/ODP8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NcKYvHyiC6zidkn0ABSIJJq5dsOwuzIxDEqdSstWXF4wsNpuIopGijYOHMzt83QINSbxM7pgMpi/hZsKHlbfgtNNkrWTHyTf3YFQq63gBG/qV68deRJmh4LkhnUF3m4p+fu8KmH3D7GScWT2IpzwkEyT9Tn9ERpXCu+JHAYso2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jH/ZPx2g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jH/ZPx2g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1419DC16AAE;
	Tue, 20 Jan 2026 16:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768925500;
	bh=2FdcTFUlXpxDIcJam3HB9XSvIJ6QLNxj/aGtOw/ODP8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jH/ZPx2gWbRebxjOoKg+5ouEIEXHMz1aLGJnqTktnLXyRzw7bF7hLNpoF/+9gBJKa
	 IpXwipXYDYnndxPxUnwh3mCWId8Bmygsi1Ir/Tb6QTF2MNOku3a0yVLD2q8tsxEIke
	 u2J3uaAb/jzNH5RjzKq61oDyixL0RLK8MU1CmLl1b6hHASi2KbXy4PsOC65dU0qnIs
	 quirRPcH+Tj5ASP+6fYWS10E87Kj35yw7t/3y02KFRs7Yb8LtDUTXemWNEs+KPuaeY
	 xnlD8MPk1P0l7pnY3bAwWzMHhBs9K8tYSL9aUnR5KtqEq8R3z2J+feuwEeUQXCw51x
	 xSPiHFpwXWpUA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 aiqun.yu@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com, 
 yijie.yang@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com
In-Reply-To: <20251215-knp-pmic-leds-v3-1-5e583f68b0e5@oss.qualcomm.com>
References: <20251215-knp-pmic-leds-v3-1-5e583f68b0e5@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 1/2] dt-bindings: leds: leds-qcom-lpg: Add
 support for PMH0101 PWM
Message-Id: <176892549681.2317951.17154378493870916934.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 16:11:36 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Mon, 15 Dec 2025 16:41:04 +0530, Jishnu Prakash wrote:
> Add support for PMH0101 PWM modules which are compatible with the PM8350c
> PWM modules.
> 
> 

Applied, thanks!

[1/2] dt-bindings: leds: leds-qcom-lpg: Add support for PMH0101 PWM
      commit: f23ead3e84085cb6119ff07584b9e30a89ee30c4

--
Lee Jones [李琼斯]

