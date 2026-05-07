Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2042636CDFE;
	Thu,  7 May 2026 13:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778160182; cv=none; b=IrDolUrJYImwKhdnkYfM9IMePKwlBznQ7Wset+qBt6FNm70w7fukAgH4Pvj2KZIiBQOx4IZ5aHgCq6eKTAiMkIMbLbzkYOPGdaZTGVI9tRNMqduz1V0QTkF2GNXfW0KFCL9MMPWjAJSN7rpNNFDgV24kGcHc/oBjN5T4eqrrh8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778160182; c=relaxed/simple;
	bh=ByxZiIyA+uVMtdU55oKuY8r2N9BLBYRNsNT+6keM270=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SC8zwqyqh+tcKTM8EOEEHTMdpkGc5q+8elGkn+0CcyysVy8zDDqthXXhm269onUM3BHN8tkqcGdwVd7E5+HV8mEvTBqtgBj7K1TUIkcKe/I/Habk3vUrYj49yv+UzQ0yBOO6vvhSbz0mJ3f3ofDT4LNmmiHZjidmo+B6godJ5zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aHUZ4G5g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aHUZ4G5g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37820C2BCC7;
	Thu,  7 May 2026 13:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778160181;
	bh=ByxZiIyA+uVMtdU55oKuY8r2N9BLBYRNsNT+6keM270=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aHUZ4G5geYg3UM4PTxRnNusCcjxzqK0vE+QjMooTBmeXOqvKI81AAxvisAOQF+NWP
	 WjmUjmy7DNcfWZkgUmff3w51pwxrJ5oNDBNddc/4DN86Ieloa9KjLMbLQ9SsKMle34
	 erlu+nkuV6n6dKx53c4V7F8ZjczgjUHmipzlHk7Bxj9yDmUxDfa4A/m3jkcZY1xNwK
	 GGZcLZUbG8x+M/kGKXTlCbHezHzyK2mM5kLaP1vUXU+zWESlvuRytw+R0MXr2LNFU+
	 xXlklOn7kbMthrcpDHkU5fJBEdxKFOgxSx0rgdvsH8Zvkji5sDTr+SFkmg1aHQbzNg
	 3yigqiPNBpgmw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: =Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
In-Reply-To: <20260427070117.18363-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260427070117.18363-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH] leds: qcom: Unify user-visible "Qualcomm"
 name
Message-Id: <177816017987.1864435.10358288110911896470.b4-ty@b4>
Date: Thu, 07 May 2026 14:22:59 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 27 Apr 2026 09:01:18 +0200, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.

Applied, thanks!

[1/1] leds: qcom: Unify user-visible "Qualcomm" name
      commit: a977c4223a615113e766704ce5b7d81bf6eaea4d

--
Lee Jones [李琼斯]

