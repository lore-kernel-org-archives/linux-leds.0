Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E612E38330C;
	Thu,  9 Jul 2026 10:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783594655; cv=none; b=LHzTwwUMKOn8/CkW2w4SoG+LMo9Wr1ET4R6E/9H0Cd1sqMAYdk4cWpZpfg7GuRZIS/pabtXmEkEpMJkK0svxh154QTfz6bNI50ncE4vtI+45YQmW4Be5jx1cqwx1EEyMwToe1eCP0zdPlNm+ITZC8qqjyi6Vmk+CkjUspfLyr3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783594655; c=relaxed/simple;
	bh=yioQIpBuK41XIFrj9plNzq1+tWOja4/XxWztXljprWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qnHkKBfMTVeMhWQtF4KOZcvTfn7VcUP8ZZ70icQtrI3x1XGRWcrh4uKilZFaoRC++lBTOHFb5zDgt4uOiA05kh3Oq1ugfCM2mNR13Lsm4L3Z94ZJUcQmxqEEYHrREhrSwfcTea7XBs4aWdzLPjR8C4/tEZOySGRCIOmYAmmlDBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9y96QwG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9y96QwG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2381F000E9;
	Thu,  9 Jul 2026 10:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783594650;
	bh=l8jwpRzuklUNqFt2VCLS4GmwDHQPef/tVTCpOjZJlFM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=b9y96QwGQyjcii+BfXrVlm4/GEmkMGeHyMF6vvO7ly7mbiCQGTNeBaJL0Ky4yW5Lr
	 VpzCIVyJsR/dv4i+c8YriAyD5bCAA5yaVpKCPqgH7fDNReyFS4PD7G343VLd1h2Z/j
	 PvVqDcYQZbJycF9pK5k3/fU7GBIrTrnGyBEH2mudjQgknhhR/dMrSN7ojOErYg7Euh
	 O4yUNMepPv2lNGdMVpmeFaS89dz1qUud5WZK1fQEga1fGDfa4+wowo+6JmDxYiTPG/
	 wfRtEuP2Onbx1oRYkYc3Y9zZx8hEYSnJ9ehVlcHT0O506MXzsrU5z8CuU2MR+hmsTo
	 U0AG77pz9bVug==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, 
 pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 Junjie Cao <junjie.cao@linux.dev>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 krzysztof.kozlowski@oss.qualcomm.com
In-Reply-To: <20260706073307.1038430-1-junjie.cao@linux.dev>
References: <20260706073307.1038430-1-junjie.cao@linux.dev>
Subject: Re: (subset) [PATCH v2] MAINTAINERS: update my email address for
 the AW99706 backlight driver
Message-Id: <178359464819.2111333.7818516262621173390.b4-ty@b4>
Date: Thu, 09 Jul 2026 11:57:28 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 06 Jul 2026 15:33:07 +0800, Junjie Cao wrote:
> Switch my maintainer entry for the Awinic AW99706 WLED backlight
> driver from my personal Gmail address to junjie.cao@linux.dev.
> 
> Update both MAINTAINERS and the device-tree binding maintainers field.

Applied, thanks!

[1/1] MAINTAINERS: update my email address for the AW99706 backlight driver
      commit: 4b3f5baf67dea91452b5b114dcb19139feba71dd

--
Lee Jones [李琼斯]

